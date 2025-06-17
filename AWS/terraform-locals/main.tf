provider "aws" {
  region = "ap-south-1"
}

locals {
    env = "staging"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.5.0.0/16"
    tags = {
        Name = "${local.env}-vpc"
    }
}

resource "aws_subnet" "my-subnet" {
   vpc_id = aws_vpc.my-vpc.id
   availability_zone = "ap-south-1a"
   cidr_block = "10.5.1.0/24"
   tags = {
        Name = "${local.env}-subnet"
   }
}

resource "aws_instance" "my-instance" {
    ami = "ami-02521d90e7410d9f0" # Example AMI, replace with a valid one for your region
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my-subnet.id
    tags = {
        Name = "${local.env}-instance"
    }
}