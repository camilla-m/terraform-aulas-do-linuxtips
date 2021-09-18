data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "worker" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = "camichan"

  tags = {
    Name = "k8s-Worker"
  }
}

resource "aws_instance" "main" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = "camichan"

  tags = {
    Name = "k8s-Main"
  }
}

resource "aws_instance" "importado" {
  count         = 1
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
}
