locals {
    ami_id = data.aws_ami.ami_2023.id
    user = data.aws_ssm_parameter.user.value
    password = data.aws_ssm_parameter.password.value
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    common_tags = {
        common_name_suffix = "${var.project_name}-${var.environment}"
    }
}