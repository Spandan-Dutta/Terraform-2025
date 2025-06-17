provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"

    provisioner "remote-exec" {
      inline = [
        "touch /home/ubuntu/spandan.txt",
        "echo 'Hello, Spandan!' > /home/ubuntu/spandan.txt"
      ]
    }

}