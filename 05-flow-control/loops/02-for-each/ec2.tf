locals {
  web_servers = {
    nginx-0 = {
      instance_type = "e2-micro"
    }
    nginx-1 = {
      instance_type = "e2-micro"
    }
  }
}

resource "aws_instance" "web" {
  for_each = local.web_servers

  ami               = "ami-0987654321"
  instance_type     = each.value.instance_type
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}
