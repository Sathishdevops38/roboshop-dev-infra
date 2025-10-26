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

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}