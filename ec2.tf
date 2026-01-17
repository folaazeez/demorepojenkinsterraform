# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "terraform" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}

