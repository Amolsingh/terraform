provider "aws" {
  #region    = "ap-southeast-1"
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.1.6"
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.15.0"
    }
  }
}

provider "postgresql" {
  host            = "postgres_server_ip"
  port            = 5432
  database        = "demo_rds"
  username        = "db_admin"
  password        = "DONOTKEYINSECRETHERE"
  sslmode         = "disable"
  connect_timeout = 15
}