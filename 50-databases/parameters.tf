# resource "aws_ssm_parameter" "user" {
#   name  = "/${var.project_name}/${var.environment}/user"
#   type  = "String"
#   value = "ec2-user"
# }

# resource "aws_ssm_parameter" "password" {
#   name  = "/${var.project_name}/${var.environment}/password"
#   type  = "String"
#   value = "DevOps321"
# }