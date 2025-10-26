module "this" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//ec2_module?ref=main"
  count = length(var.instance_list)
  project_name = var.project_name
  environment = var.env  
  instance_type = var.instance_type
  sg_ids =   [var.sg_id]
  tags= merge(
    var.tags,
    local.common_tags,{
      Name = format("%s-%s", local.common_name_suffix, var.instance_list[count.index])
    }  
  )  
}

