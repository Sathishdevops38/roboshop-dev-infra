variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "alb_tags" {
  default = {
    created_by = "terraform"
  }
}

variable "load_balancer_type" {
  default = "application"
}

variable "target_type" {
  default = "instance"
}

variable "port" {
  default = 80
}

variable "protocol" {
  default = "HTTP"
}

variable "alb_tg_tags"{
  default = {
    created_by = "terraform"
  }
}

variable "zone_id" {
  default = "Z05700624Q21KABEP00F"
}

variable "domain_name" {
  default = "daws38sat.fun"
}
