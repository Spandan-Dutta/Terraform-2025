provider "aws" {
    region = "ap-south-1"
}

terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key = key/terraform.tfstate
        region = "ap-south-1"
    }
 }

resource "aws_instance" "ec2_example" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "example-instance"
    }
}