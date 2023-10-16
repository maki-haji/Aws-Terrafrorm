terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAXSDEXCWXH2WVZ5OT"
  secret_key = "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"
}


resource "aws_vpc" "MyLab-Vpc" {
  cidr_block = "172.20.0.0/16"
  tags = {
     Name = "MyLab-Vpc"
    
  }
}

# creating Subnet (Public)
resource "aws_subnet" "MyLab-Subnet1" {
  vpc_id     = aws_vpc.MyLab-Vpc.id
  cidr_block = "172.20.10.0/24"

  tags = {
    Name = "MyLab-Subnet1"
  }
} 

# creating internet Gateway
resource "aws_internet_gateway" "MyLab-InternetGW" {
  vpc_id = aws_vpc.MyLab-Vpc.id

  tags = {
    Name = "MyLab-InternetGW"
  }
  
}

# create Security Group
resource "aws_security_group" "Mylab_sec_group" {
  name = "myLab Security Group"
  description = "To Allow Inbound and Ourbound traffic to mylab"
  vpc_id = aws_vpc.MyLab-Vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    

  }
  egress = {
    from_port = 0
    to_port = 0
    protocol = "1"
    cidr_block = ["0.0.0.0/0"]

  }

  tags = {
    Name = " Allow traffic"
  }
}
