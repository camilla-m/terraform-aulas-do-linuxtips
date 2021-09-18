provider "aws" {
  region  = "us-east-1"
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
  count         = 1
  ami           = var.image_id
  instance_type = "t2.micro"
  key_name      = "testecami"

  tags = {
    Name = "Welcome to ${var.environment}"
  }

  provisioner "local-exec" {
    command = "sleep 60 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook-inicial.yml -i terraform.aws_ec2.yml -u ubuntu --key-file ~/.ssh/testecami.pem"
  }
}