variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}


# variable "sg_id" {
#   default = "sg-0c47540247b9b3fa5"
# }

variable "instance_type" {
  default = "t3.micro"
}

# variable "instance_list" {
#   default = ["mongodb","mysql"]
# }

variable "tags" {
  default = {
    Terraform = true
  }
}

# variable "user_data" {
#   type = string
# }

