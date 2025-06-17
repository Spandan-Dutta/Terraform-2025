provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my_instance" {
    ami = "ami-02521d90e7410d9f0"
    associate_public_ip_address = var.enable_public_ip
    tags = {
        Name = "MyInstance"
    }
}

variable "enable_public_ip" {
    description = "Enable public IP for the AWS EC2 instance"
    type        = bool
    default     = true
}
