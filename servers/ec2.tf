provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  count         = var.environment == "Production" ? 5 : 1
  ami           = var.image_id
  instance_type = "t3.medium"

  tags = {
    Name = "Welcome to ${var.environment}"
  }
}