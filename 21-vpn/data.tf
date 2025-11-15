# Find the most recent AMI for OpenVPN
data "aws_ami" "openvpn_ami" {
  most_recent = true
  owners      = ["679593333241"] # Or the specific owner ID
  filter {
    name   = "name"
    values = ["OpenVPN Access Server Marketplace Image-fe8020db-*"] # Adjust the name based on the actual AMI
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter"  "openvpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/openvpn_sg_id"
}
