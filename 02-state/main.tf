provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-examples-terraform-state"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_state" {
  name         = "terraform-state"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-examples-terraform-state"
    key            = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform-state"
    region         = "us-east-2"
    encrypt        = true
  }
}

// Import existing EC2 instance:
// Note: Define the resource first, then run:
//
//   terraform import aws_instance.example <instance_id>

// Remove resource from state:
// Note: Comment/delete the resource block, then run:
//
//   terraform state rm aws_instance.example
# resource "aws_instance" "example" {
#   ami           = "ami-04f167a56786e4b09"
#   instance_type = "t2.micro"

#   vpc_security_group_ids = ["sg-093af3842333e054f"]

#   tags = {
#     Name = "bastion"
#   }
# }
