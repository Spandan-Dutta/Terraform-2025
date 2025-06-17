terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

locals {
    env = "production"
}

resource "aws_vpc" "my-project-vpc" {
    cidr_block = var.vpc-cidr
    tags = {
        Name = "${local.env}-vpc"
    }
}

resource "aws_subnet" "my-project-subnet-1" {
    vpc_id            = aws_vpc.my-project-vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a" 
    map_public_ip_on_launch = true
    tags = {
        Name = "${local.env}-subnet-1"
   }
}


resource "aws_subnet" "my-project-subnet-2" {
    vpc_id            = aws_vpc.my-project-vpc.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
    tags = {
        Name = "${local.env}-subnet-2"
   }
}

resource "aws_internet_gateway" "my-project-igw" {
    vpc_id = aws_vpc.my-project-vpc.id
    tags = {
        Name = "${local.env}-igw"
    }  
}

resource "aws_route_table" "my-project-rt" {
    vpc_id = aws_vpc.my-project-vpc.id
    tags = {
        Name = "${local.env}-route-table"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-project-igw.id
    }
}

resource "aws_route_table_association" "my-project-rt-assoc-1" {
    subnet_id      = aws_subnet.my-project-subnet-1.id
    route_table_id = aws_route_table.my-project-rt.id  
}

resource "aws_route_table_association" "my-project-rt-assoc-2" {
    subnet_id      = aws_subnet.my-project-subnet-2.id
    route_table_id = aws_route_table.my-project-rt.id  
}

