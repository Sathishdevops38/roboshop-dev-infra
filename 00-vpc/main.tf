module "this" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//vpc_module?ref=main"
  cidr = var.vpc_cidr
  project_name = var.project_name
  environment = var.environment
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

   is_peering_required = true
}
