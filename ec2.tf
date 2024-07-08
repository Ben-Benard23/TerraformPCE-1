resource "aws_instance" "Ben" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  user_data     = <<-EOF
            #!/bin/bash 
            yum update -y 
            yum install -y httpd 
            systemctl start httpd 
            systemctl enable httpd 
            EOF
  tags          = { Name = "PCE-terraform" }
  count         = 2
  associate_public_ip_address = true

}

resource "aws_iam_role" "admin_role" {
  name = "admin_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "admin_role_policy_attachment" {
  role       = aws_iam_role.admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "admin_profile" {
  name = "admin_profile"
  role = aws_iam_role.admin_role.name
}

