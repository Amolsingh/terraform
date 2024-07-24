resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// POSTGRES
resource "aws_security_group" "allow_rds" {
  name = "allow_rds"
  description = "Allow RDS inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    description = "PostgreSQL"
    cidr_blocks = ["0.0.0.0/0"] // >
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    description = "PostgreSQL"
    cidr_blocks = ["0.0.0.0/0"] // >
  }

  ingress {
    from_port     = 5432
    to_port       = 5432
    protocol      = "TCP"
    description   = "PostgreSQL"
    cidr_blocks   = ["0.0.0.0/0"] // >
  }
}