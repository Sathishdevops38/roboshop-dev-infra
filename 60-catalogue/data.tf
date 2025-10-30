data "aws_ami" "ami_2023" {
  most_recent = true
  owners      = ["self"] # The owner alias for official Amazon AMIs

  filter {
    name   = "name"
    values = ["devops-practice-ami"] # Filter for AL2023 AMIs, adjust for arm64 if needed
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Specify the desired architecture
  }
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user" {
  name = "/${var.project_name}/${var.environment}/user"
}

data "aws_ssm_parameter" "password" {
  name = "/${var.project_name}/${var.environment}/password"
}