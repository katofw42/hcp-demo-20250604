terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "web" {
  count         = 4
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  
  tags = {
    Name = "web-${count.index + 1}"
  }
}