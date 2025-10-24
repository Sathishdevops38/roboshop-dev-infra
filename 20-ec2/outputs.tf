output "public_ip" {
  value = module.this[*].public_ip
}

output "priavte_ip" {
  value = module.this[*].private_ip
}

output "public_dns" {
  value = module.this[*].public_dns
}