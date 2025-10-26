# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   description = "Security group for user-service with custom ports open within VPC"
#   use_name_prefix = false
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value
#   tags = local.common_name_suffix
# }

#using own module
module "this" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//sg_module?ref=main"
  count = length(var.sg_name)
  sg_name = var.sg_name[count.index]
  description = "Created for ${var.sg_name[count.index]}"
  project_name = var.project_name
  environment = var.environment
  vpc_id = local.vpc_id
  sg_tags = var.sg_tags

}