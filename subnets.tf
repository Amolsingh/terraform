resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds_subnet"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id]

  tags = {
    Name = "My demo DB subnet group"
  }
}