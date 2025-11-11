output "alb_arn" {
  value = module.frontend_alb.alb_arn
}

output "tg_arn" {
  value = module.frontend_alb.tg_arn
}

output "alb_zone_id" {
  value = module.frontend_alb.alb_zone_id
}