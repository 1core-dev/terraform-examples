provider "aws" {
  region = "us-east-2"

  # Tags to apply to all AWS resources by default
  default_tags {
    tags = {
      Owner     = "team-foo"
      ManagedBy = "Terraform"
    }
  }
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami         = "ami-0fb653ca2d3203ac1"
  server_text = "New server text"

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key

  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 2
  enable_autoscaling = false


  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }

}
