resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id = local.private_subnet_id

    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-catalogue" # roboshop-dev-mongodb
        }
)
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]
  
  connection {
    type     = "ssh"
    user     =  aws_ssm_parameter.user.value #"ec2-user"
    password =  aws_ssm_parameter.password.value #"DevOps321" 
    host     = aws_instance.catalogue.private_ip
  }

  # terraform copies this file to mongodb server
  provisioner "file" {
    source = "catalogue.sh"
    destination = "/tmp/catalogue.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/catalogue.sh",
        # "sudo sh /tmp/catalogue.sh"
        "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
    ]
  }
}
