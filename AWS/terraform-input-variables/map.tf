provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my_instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = var.instance_type
    tags = var.project_environment
}

variable "project_environment" {
    description = "Project Name and Environment"
    type = map(string)
    default = {
      "project" = "on-demand"
      "environment" = "dev"
    }
}
