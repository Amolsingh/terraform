resource "aws_instance" "frontend_instance" {
  ami             = var.ec2_ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.allow_web.id]

  user_data = <<-EOL
  #!/bin/bash -xe

  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo -i
  echo "<h1> Hello World from $(hostname -f) </h1>" > /var/www/html/index.html 
  EOL

  tags = {
    Name = "frontend_instance"
  }
}

resource "aws_instance" "backend_instance" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "backend_instance"
  }
}