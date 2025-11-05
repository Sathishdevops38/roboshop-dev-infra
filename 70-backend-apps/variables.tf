variable "components" {
  description = "Map of components to deploy with specific settings."
  type = map(object({
    instance_type       = string
    port                = number
    health_check_path   = string
    priority = number
  }))
  default = {
    "catalogue" = {
      instance_type       = "t3.micro"
      port                = 8080
      health_check_path   = "/health"
      priority = 10
    }
    "user" = {
      instance_type       = "t3.micro"
      port                = 8080
      health_check_path   = "/health"
      priority = 20
    }
    "cart" = {
      instance_type       = "t3.micro"
      port                = 8080
      health_check_path   = "/health"
      priority = 30
    }

    "payment" = {
      instance_type       = "t3.micro"
      port                = 8080
      health_check_path   = "/health"
      priority = 40
    }
    "shipping" = {
      instance_type       = "t3.micro"
      port                = 8080
      health_check_path   = "/health"
      priority = 50
    }
  }
}


variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "domain_name" {
  default = "daws38sat.fun"
}



