terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    // This backend configuration is filled in automatically at test time 
    // by Terratest. If you wish to run this example manually, uncomment 
    // and fill in the config below.

    # bucket       = "<YOUR S3 BUCKET>"
    # key          = "<SOME PATH>/terraform.tfstate"
    # region       = "us-east-2"
    # encrypt      = true
    # use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "postgres"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
}
