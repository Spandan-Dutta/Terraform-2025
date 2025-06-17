provider "aws" {
  region = "ap-south-1"
}


resource "aws_iam_user" "aws_users" {
    count = length(var.user_names)
    name  = var.user_names[count.index]
    tags = {
        Name = "MyUser-${count.index + 1}"
    }
}



variable "user_names" {
    description = "IAM Users"
    type        = list(string)
    default     = ["user1" , "user2", "user3"]
}
