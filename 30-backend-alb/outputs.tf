output "alb_arn" {
  value = module.backend_alb.alb_arn
}

output "tg_arn" {
  value = module.backend_alb.tg_arn
}

output "alb_dns_name" {
  value = module.backend_alb.alb_dns_name
}

output "alb_zone_id" {
  value = module.backend_alb.alb_zone_id
}