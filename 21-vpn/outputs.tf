output "public_ip" {
  value = aws_instance.openvpn_instance.public_ip
}

output "priavte_ip" {
  value = aws_instance.openvpn_instance.private_ip
}

output "public_dns" {
  value = aws_instance.openvpn_instance.public_dns
}