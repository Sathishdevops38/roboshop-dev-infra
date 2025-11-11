locals {
    ami_id = data.aws_ami.ami_2023.id
    user = data.aws_ssm_parameter.user.value
    password = data.aws_ssm_parameter.password.value
    public_subnet_id = split("," , data.aws_ssm_parameter.public_subnet_ids.value)[0]
    public_subnet_ids = split("," , data.aws_ssm_parameter.public_subnet_ids.value)
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
    frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = {
        common_name_suffix = "${var.project_name}-${var.environment}"
    }
}