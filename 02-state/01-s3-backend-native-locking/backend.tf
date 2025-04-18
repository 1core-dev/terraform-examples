// Initialize with S3 backend:
//    terraform init -backend-config=./backend.hcl
//
// This stores the state file in S3 at "global/s3/terraform.tfstate".
terraform {
  backend "s3" {
    key = "global/s3/terraform.tfstate"
  }
}
