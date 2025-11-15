locals {
  common_name_suffix = "${var.project_name}-${var.environment}"
  ami = data.aws_ami.openvpn_ami.id
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value
  common_tags = {
        Terraform = "true"
    }
}