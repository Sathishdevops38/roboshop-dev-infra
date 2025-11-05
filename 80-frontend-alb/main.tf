module "frontend_alb" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//30-alb-module?ref=main"
  name = local.alb_name
  project_name = var.project_name
  environment = var.environment
  security_groups = local.frontend_lb_sg_id
  subnets = local.public_subnet_id
  alb_tags = var.alb_tags
  load_balancer_type = var.load_balancer_type

  #tg config
  tg_name = local.tg_name
  target_type = var.target_type
  tg_port = var.port
  tg_protocol = var.protocol
  vpc_id = local.vpc_id
  alb_tg_tags = var.alb_tg_tags
}

resource "aws_lb_listener" "frontend_alb" {
  load_balancer_arn = module.frontend_alb.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"

  forward {
      target_group {
        arn    = module.frontend_alb.tg_arn
        weight = 100
      }
    }
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "${var.environment}.${var.domain_name}" # daws86s.fun
  type    = "A"
  ttl     = 1

  alias {
    name                   = module.frontend_alb.alb_dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }
}

