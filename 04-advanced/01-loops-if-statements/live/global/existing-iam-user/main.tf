provider "aws" {
  region = "us-east-2"
}


// $ terraform import aws_iam_user.existing_user existing.user
resource "aws_iam_user" "existing_user" {
  # Make sure to update this to your own user name!
  name = "existing.user"
}
