output "aws_instance_ip" {
   description = "This is the public IP of the AWS instance"
   value = aws_instance.my-aws-instance.public_ip
}