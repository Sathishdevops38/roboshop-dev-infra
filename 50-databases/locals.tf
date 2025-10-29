locals {
  common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  database_subnet_ids = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ami_id = data.aws_ami.ami_2023.id
  # user= aws_ssm_parameter.user.value
  # password= aws_ssm_parameter.password.value
  common_tags = {
      Project = var.project_name
      Environment = var.environment
      Terraform = "true"
  }
}