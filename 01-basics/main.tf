provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-04f167a56786e4b09"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World!" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

  user_data_replace_on_change = true

  tags = {
    Name = "my-ubuntu"
  }
}

resource "aws_security_group" "instance" {
  name = "web"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
