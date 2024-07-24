resource "aws_instance" "frontend_instance" {
  ami           = "ami-012c2e8e24e2ae21d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.allow_web.id]

  user_data = <<-EOL
  #!/bin/bash -xe

  mkdir actions-runner && cd actions-runner
  curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz
  echo "9e883d210df8c6028aff475475a457d380353f9d01877d51cc01a17b2a91161d  actions-runner-linux-x64-2.317.0.tar.gz" | shasum -a 256 -c
  tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz
  EOL

  tags = {
    Name = "frontend_instance"
  }
}

resource "aws_instance" "backend_instance" {
  ami           = "ami-012c2e8e24e2ae21d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "backend_instance"
  }
}