resource "aws_instance" "Ben" {
  ami                         = "ami-08a0d1e16fc3f61ea"
  instance_type               = "t2.micro"
  user_data                   = <<-EOF
            #!/bin/bash 
            yum update -y 
            yum install -y httpd 
            systemctl start httpd 
            systemctl enable httpd 
            EOF
  tags                        = { Name = "PCE-terraform" }
  count                       = 1
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.admin_profiles.name

}





