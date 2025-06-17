provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    key_name = "spandan-mac"
    tags = {
        Name = "example-instance"
    }

    provisioner "file" {
        source = "/Users/spandandutta/Downloads/photo.pdf"
        destination = "/home/ubuntu/photo.pdf"
    }

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("/Users/spandandutta/Downloads/spandan-mac.pem")
        host = self.public_ip
        timeout = "5m"
    }
}

resource "aws_security_group" "main" {
    name = "custom_security_group"
    description = "Custom security group for EC2 instance"
    vpc_id = "vpc-0a1b2c3d4e5f6g7h8"
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = ""
            from_port = 0
            to_port = 0
            ipv6_cidr_blocks = []
            protocol = "-1"
            security_groups = []
            self = false
            prefix_list_ids = []
        }
    ]

    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow SSH access"
            from_port = 22
            to_port = 22
            ipv6_cidr_blocks = []
            protocol = "tcp"
            security_groups = []
            self = false
            prefix_list_ids = []

        }
    ]
}