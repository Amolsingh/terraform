provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "ap-southeast-1"
}

terraform {
  required_version = ">= 1.1.6"
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.15.0"
    }
  }
}

provider "postgresql" {
  host            = "postgres_server_ip"
  port            = 5432
  database        = "demo_rds"
  username        = "db_admin"
  password        = ""
  sslmode         = "disable"
  connect_timeout = 15
}