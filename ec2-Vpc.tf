provider "aws" {
  region     = "eu-west-2"
  access_key = "AAKIAXSDEXCWXH2WVZ5OT"
  secret_key = "xWTXn4lY+ZLk/bmCuamFy9+dWbtTAyp51OEQmqgD"
}

resource "aws_instance" "My-ec2" {
  ami = "ami-030594f92006445fd"
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
