provider "aws" {
    region = "ap-south-1"
}

locals {
    ingress_rules = [
        { 
            port        = 80
            protocol    = "tcp"
            description = "HTTP access"
        },
        { 
            port        = 22
            protocol    = "tcp"
            description = "SSH access"
        }
    ] 
}

resource "aws_instance" "my-instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "MyInstance"
    }
}

resource "aws_security_group" "main-sg" {
    name = "my-instance-sg"
    description = "Security group for my instance"

    dynamic "ingress" {
        for_each = local.ingress_rules
        content {
            description = ingress.value.description
            from_port = ingress.value.port
            to_port = ingress.value.port
            protocol = ingress.value.protocol
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
        Name = "MyInstanceSG"
    }
  
}