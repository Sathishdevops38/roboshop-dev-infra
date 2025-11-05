module "backend_alb" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//30-alb-module?ref=main"
  name = local.alb_name
  project_name = var.project_name
  environment = var.environment
  security_groups = local.backend_lb_sg_id
  subnets = local.public_subnet_id
  alb_tags = var.alb_tags
  load_balancer_type = var.load_balancer_type

  #tg config
  tg_name = local.tg_name
  target_type = var.target_type
  tg_port = var.port
  tg_protocol = var.protocol
  vpc_id = local.vpc_id
  alb_tg_tags = var.alb_tg_tags
}

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = module.backend_alb.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"

  forward {
      target_group {
        arn    = module.backend_alb.tg_arn
        weight = 100
      }
    }
  }
}

