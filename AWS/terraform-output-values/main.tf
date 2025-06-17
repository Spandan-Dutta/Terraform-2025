provider "aws" {
   region = "ap-south-1"
}

locals {
    env = "preprod"
}

resource "aws_instance" "my-instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "${local.env}-instance"
    }
}

output "my_instance_public_ip" {
    description = "value of the public IP of the instance"
    value = aws_instance.my-instance.public_ip
}

output "my_instance_private_ip" {
    description = "value of the private IP of the instance"
    value = aws_instance.my-instance.private_ip
    sensitive = true 
}

# Using a map to output both public and private IPs
output "instance_ips" {
    value = {
        public_ip  = aws_instance.my-instance.public_ip
        private_ip = aws_instance.my-instance.private_ip
    }
}

resource "aws_instance" "ec2_example" {
    count = 3
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "test-t2-micro"
    }
}

output "fetched_info_from_aws" {
    value = ["${aws_instance.ec2_example.*.public_dns}"]
}