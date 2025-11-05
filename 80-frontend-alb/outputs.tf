output "alb_arn" {
  value = module.frontend_alb.alb_arn
}

output "tg_arn" {
  value = module.frontend_alb.tg_arn
}