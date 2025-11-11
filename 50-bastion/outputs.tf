output "public_ip" {
  value = module.bastion.public_ip
}

output "priavte_ip" {
  value = module.bastion.private_ip
}

output "public_dns" {
  value = module.bastion.public_dns
}