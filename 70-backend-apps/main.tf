# Root Configuration main.tf

# -----------------------------------------------------------------------------
# 1. Module Call: Deploy multiple components using for_each
# -----------------------------------------------------------------------------
module "roboshop_components" {
  # Iterates through the map defined in var.components (catalogue, user, shipping)
  for_each = var.components
  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//40-backend-app?ref=main"
  
  # Pass common variables to the module
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
  domain_name  = var.domain_name

  # Pass the unique component configuration
  component_name       = each.key                  # e.g., "catalogue"
  instance_type        = each.value.instance_type  # e.g., "t3.micro"
  application_port     = each.value.port           # e.g., 8080
  health_check_path    = each.value.health_check_path # e.g., "/health"
  priority             = each.value.priority
}