resource "aws_instance" "frontend" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.frontend_sg_id]
    subnet_id = local.public_subnet_id

    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-frontend" # roboshop-dev-catalogue
        }
)
}

resource "terraform_data" "frontend" {
  triggers_replace = [
    aws_instance.frontend.id
  ]
  
  connection {
    type     = "ssh"
    user     =  local.user #"ec2-user"
    password =  local.password #"DevOps321" 
    host     = aws_instance.frontend.private_ip
  }

  # terraform copies this file to mongodb server
  provisioner "file" {
    source = "frontend.sh"
    destination = "/tmp/frontend.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/frontend.sh",
        # "sudo sh /tmp/catalogue.sh"
        "sudo sh /tmp/frontend.sh catalogue ${var.environment}"
    ]
  }
}

resource "aws_ec2_instance_state" "frontend" {
  instance_id = aws_instance.frontend.id
  state       = "stopped"
  depends_on = [ terraform_data.frontend ]
}

resource "aws_ami_from_instance" "frontend-ami" {
  name               = "${var.project_name}-${var.environment}-frontend-ami"
  source_instance_id = aws_instance.frontend.id
  depends_on = [ aws_ec2_instance_state.frontend ]
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${self.source_instance_id} --region ${var.aws_region}"
    when = create
  }
  tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-frontend-ami" # roboshop-dev-frontend
        }
)
}

resource "aws_lb_target_group" "frontend" {
  name = "${var.project_name}-${var.environment}-frontend-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = local.vpc_id
  deregistration_delay = 60 # waiting period before deleting the instance
  health_check {
    healthy_threshold = 2
    interval = 10
    matcher = "200-299"
    path = "/health"
    port = 8080
    protocol = "HTTP"
    timeout = 2
    unhealthy_threshold = 2
  }
}

resource "aws_launch_template" "frontend" {
  name = "${var.project_name}-${var.environment}-frontend"
  image_id = aws_ami_from_instance.frontend-ami.id

  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t3.micro"

  vpc_security_group_ids = [local.frontend_sg_id]

  # tags attached to the instance
  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-frontend"
      }
    )
  }

  # tags attached to the volume created by instance
  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-frontend"
      }
    )
  }

  # tags attached to the launch template
  tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-frontend"
      }
  )

}

resource "aws_autoscaling_group" "frontend" {
  name                      = "${var.project_name}-${var.environment}-frontend"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = false
  launch_template {
    id      = aws_launch_template.frontend.id
    version = aws_launch_template.frontend.latest_version
  }
  vpc_zone_identifier       = local.public_subnet_ids
  target_group_arns = [aws_lb_target_group.frontend.arn]
  
  dynamic "tag" {  # we will get the iterator with name as tag
    for_each = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-frontend"
      }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  timeouts {
    delete = "15m"
  }

}


resource "aws_autoscaling_policy" "example" {
  autoscaling_group_name = aws_autoscaling_group.frontend.name
  name                   = "${var.project_name}-${var.environment}-frontend"
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 75.0
  }
}

resource "aws_lb_listener_rule" "frontend" {
  listener_arn = local.frontend_alb_listener_arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }

  condition {
    host_header {
      values = ["frontend.frontend-alb-${var.environment}.${var.domain_name}"]
    }
  }
}