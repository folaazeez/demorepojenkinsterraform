terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "example" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
regio

  tags = {
    Name = "HelloWorld"
  }
}

mhfhchtlkwtgpofg
