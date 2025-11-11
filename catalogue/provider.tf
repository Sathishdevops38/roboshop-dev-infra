terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-86s"
    key    = "roboshop-infra-catalogue"
    region = "us-west-2"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
}