resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project_name}/${var.environment}/_sg_id"
  type  = "String"
  value = module.this.sg_id
}