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

