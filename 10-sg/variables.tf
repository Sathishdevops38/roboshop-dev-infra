variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "sg_name" {
  default = "catalogue"
}

variable "sg_tags" {
  default = {
    created_by = "terraform"
  }
}

variable "sg_description" {
  default = "This sg for app"
}

