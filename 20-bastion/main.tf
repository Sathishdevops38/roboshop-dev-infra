module "bastion" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//ec2_module?ref=main"
  ami=local.ami_id
  project_name = var.project_name
  environment = var.env  
  instance_type = var.instance_type
  sg_ids =   [local.public_subnet_id]
  tags= merge(
    var.tags,
    local.common_tags,{
      Name =  "${var.project_name}-${var.environment}-bastion"
    }
  )  
}

