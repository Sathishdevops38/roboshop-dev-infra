data "aws_ami" "ami_2023" {
  most_recent = true
  owners      = ["amazon"] # The owner alias for official Amazon AMIs

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"] # Filter for AL2023 AMIs, adjust for arm64 if needed
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Specify the desired architecture
  }
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.environment}/redis_sg_id"
}
data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project_name}/${var.environment}/rabbitmq_sg_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/database_subnet_ids"
}

# data "aws_ssm_parameter" "user" {
#   name = "/${var.project_name}/${var.environment}/user"
# }

# data "aws_ssm_parameter" "password" {
#   name = "/${var.project_name}/${var.environment}/password"
# }