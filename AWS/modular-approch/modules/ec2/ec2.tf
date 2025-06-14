provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-aws-instance" {
    ami = var.aws_ami_value
    instance_type = var.aws_instance_type_value
    tags = {
        Name = "MyAWSInstance"
    }
}