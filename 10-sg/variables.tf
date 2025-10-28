variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "sg_name" {
  default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # backend
        "catalogue", "user", "cart", "shipping", "payment",
        # frontend
        "frontend",
        # bastion
        "bastion",
        # frontend load balancer
        "frontend-lb",
        # backend load balancer
        "backend-lb"
      ]
}

variable "sg_tags" {
  default = {
    created_by = "terraform"
  }
}

# variable "sg_description" {
#   default = "This sg for app"
# }

