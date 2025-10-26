locals {
  common_tags={
    Terraform = true
  }
  common_name_suffix = "${var.project_name}-${var.env}" #roboshop-dev-catalogue
}