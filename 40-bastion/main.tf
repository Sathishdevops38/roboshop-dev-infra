module "bastion" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//20-bastion-module?ref=main"
  # ami=local.ami_id
  project_name = var.project_name
  environment = var.environment
  subnet_id = local.public_subnet_id  
  instance_type = var.instance_type
  sg_ids =   [local.bastion_sg_id]
  iam_profile_name = aws_iam_instance_profile.bastion.name
    # need more for terraform
  root_volume_size = 50
  root_volume_type = "gp3"

  user_data = file("bastion.sh")
  tags= merge(
    var.tags,
    local.common_tags,{
      Name =  "${var.project_name}-${var.environment}-bastion"
    }
  )  
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
}

