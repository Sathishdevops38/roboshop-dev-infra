# Launch an EC2 instance using the found AMI
resource "aws_instance" "openvpn_instance" {
  ami           = local.ami
  instance_type = var.instance_type # Example instance type
  vpc_security_group_ids = [local.openvpn_sg_id]
  subnet_id = local.public_subnet_id
  user_data = file("bootstrap.sh")
  tags= merge(
    local.common_tags,{
      Name =  "${local.common_name_suffix}-openvpn"
    }
  )
}