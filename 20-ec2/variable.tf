variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "num_instance" {
  default = 1
}

variable "instance_name"{
    type = list
    default = ["catalogue"]
}

variable "sg_id" {
  default = "sg-0600160900a41e0f2"
}

variable "instance_type" {
  default = "t3.micro"
}