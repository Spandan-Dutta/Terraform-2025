# What is Null Resource?
# A null resource is a resource that does not create any real infrastructure but can be used to run provisioners or trigger actions.

# What it does?
# 1. Execute Commands.check" 
# 2. Run Shell Script.  
# 3. Run Ansible Playbook.
# 4. Run Python Script.


# resource "null_resource" "null_resource_example" {
#     triggers = {
#         id = aws_instance.ec2_example.id
#     }

#     provisioner "local-exec" {
#         command = "echo Hello World"
#     }
# }


provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "example-instance"
    }
}

resource "null_resource" "null_resource_example" {

    triggers = {
      id = timestamp()
    }
    
    provisioner "local-exec" {
        command = "echo Hello World"
    }
} 
  
