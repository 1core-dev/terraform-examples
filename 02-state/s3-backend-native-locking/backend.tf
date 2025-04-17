terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "gl0bal-un1que-6ucket-tf-sta7e"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"

    # S3 backend native locking
    use_lockfile = true
  }
}
