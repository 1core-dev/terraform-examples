terraform {
  backend "s3" {
    bucket = "gl0bal-un1que-6ucket-tf-sta7e"
    key    = "workspaces-example/terraform.tfstate"
    region = "us-east-2"

    use_lockfile = true
    encrypt      = true
  }
}
