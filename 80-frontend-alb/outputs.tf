output "alb_arn" {
  value = module.backend_alb.alb_arn
}

output "tg_arn" {
  value = module.backend_alb.tg_arn
}