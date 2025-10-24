module "this" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//ec2_module?ref=main"
  count = var.num_instance
  instance_type = var.instance_type
  sg_ids =   [var.sg_id]
  num_instance = var.num_instance
  project_name = var.project_name
  environment = var.environment
  instance_name = var.instance_name
  tags= merge(
        local.base_tags,{
        "Name" = "${local.common_name_suffix}-${count.index}"
        }
        
    )
}

