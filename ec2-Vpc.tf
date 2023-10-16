provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAXSDEXCWXH2WVZ5OT"
  secret_key = "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"
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

# creating Subnet (Public)
resource "aws_subnet" "MyLab-Subnet1" {
  vpc_id     = aws_vpc.MyLab-Vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "MyLab-Subnet1"
  }
} 

resource "aws_security_group" "MyLab_sec_Group" {
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

   tags = {
    Name = " Allow traffic"
   } 
   }
   



}

