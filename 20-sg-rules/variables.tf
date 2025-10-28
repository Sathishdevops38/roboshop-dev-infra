variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "sg_rule_tags" {
  default = {
    created_by = "terraform"
  }
}


