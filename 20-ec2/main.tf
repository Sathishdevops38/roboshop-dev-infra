module "this" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//ec2_module?ref=main"
  num_instance = var.instance_num
  project_name = var.project_name
  environment = var.env
  instance_type = var.instance_type
  sg_ids =   [var.sg_id]
  tags= {
    terraform = true
  }
}

