resource "aws_db_instance" "demo_rds" {
  identifier             = "appdb"
  instance_class         = var.rds_instance_class
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = var.rds_postgres_engine_version
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.allow_rds.id]
  parameter_group_name   = aws_db_parameter_group.demo_rds_parameter_group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

resource "aws_db_parameter_group" "demo_rds_parameter_group" {
  name   = "demo-postgres"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  lifecycle {
    create_before_destroy = true
  }
}