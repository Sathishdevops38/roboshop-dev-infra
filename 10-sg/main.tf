module "catalogue" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${local.common_name_suffix}-catalogue"
  description = "Security group for user-service with custom ports open within VPC"
  use_name_prefix = false
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
  tags = local.common_name_suffix
}