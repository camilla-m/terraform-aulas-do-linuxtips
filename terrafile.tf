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
  ami           = data.aws_ami.ubuntu.name
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}