variable "ami_id" {
    description = "Value of the AMI ID to be used for the EC2 instance"
    type = string
    default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
    description = "Value of the instance type to be used for the EC2 instance"
    type = string
    default = "t2.micro"
}