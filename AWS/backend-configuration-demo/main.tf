provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t2.micro"
    tags = {
        Name = "MyInstance"
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-111202020-bucket"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "dev"
    Name        = "terraform-locks"
  }
}
