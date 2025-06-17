provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my_instance" {
    ami = "ami-02521d90e7410d9f0"
    count = var.instance_count
    tags = {
        Name = "MyInstance"
    }
}

variable "instance_count" {
    description = "Instance count for the AWS EC2 instance"
    type        = number
    default     = 2
}
