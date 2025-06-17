provider "aws" {
   region = "ap-south-1"
}

variable "user_names" {
    description = "List of user names"
    # type = list(string)
    type = set(string)
    default = ["user1", "user2", "user3"]
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "Terraform-EC2"
    }
}

# Example of loops with count

# resource "aws_iam_user" "example_user" {
#     count = length(var.user_names)
#     name = var.user_names[count.index]
# }

# resource "aws_iam_user" "example_user" {
#     for_each = var.user_names
#     name  = each.value
# }

output "print_the_names" {
    value = [for name in var.user_names: name]
}
 