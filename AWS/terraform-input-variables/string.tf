provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my_instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = var.instance_type
    tags = {
        Name = "MyInstance"
    }
}

variable "instance_type" {
    description = "Instance type for the AWS EC2 instance"
    type        = string
    default     = "t2.micro" 
}
