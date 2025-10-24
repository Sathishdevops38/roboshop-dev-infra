module "this" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//ec2_module?ref=main"
  instance_type = var.instance_type
  sg_ids =   [var.sg_id]
  num_instance = var.instance_num
  project_name = var.project_name
  environment = var.env
  tags= {
    terraform = true
  }
}

