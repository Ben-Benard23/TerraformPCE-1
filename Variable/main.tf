resource "aws_instance" "Ben" {
  ami                         = var.ami
  instance_type               = var.instance_type[1]
  user_data                   = <<-EOF
            #!/bin/bash 
            yum update -y 
            yum install -y httpd 
            systemctl start httpd 
            systemctl enable httpd 
            EOF
  tags                        = var.tags
  count                       = var.number
  associate_public_ip_address = var.associate_public_ip_address


}

resource "aws_vpc" "Ben" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_hostnames
  enable_dns_hostnames = true
  tags = {
    Name = "Ben-vpc"
  }
}





