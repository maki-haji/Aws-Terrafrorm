provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAXSDEXCWXHWXDXSZS"
  secret_key = "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"
}

resource "aws_instance" "My-ec2" {
  ami = "ami-0eb260c4d5475b901"
  instance_type = "t2.micro"

  tags = {
    Name = "Hellow Soomaalia"
  }
}

resource "aws_vpc" "MyLab-Vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
     Name = "MyLab-Vpc"
  }
}
