locals {
  alb_name= "${var.project_name}-${var.environment}-backend-alb" 
  tg_name = "${var.project_name}-${var.environment}-backend-alb-tg" 
  private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[*]
  backend_lb_sg_id = data.aws_ssm_parameter.backend_lb_sg_id.value
  vpc_id= data.aws_ssm_parameter.vpc_id.value
  common_tags = {
    Project = var.project_name
    Environment = var.environment
    Terraform = "true"
    }
}