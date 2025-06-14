provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./modules/ec2"
  aws_instance_type_value = "t2.micro"
  aws_ami_value = "ami-02521d90e7410d9f0" 
}

module "s3_bucket" {
   source = "./modules/s3"
   bucket_name = "my-unique-1111111222222-bucket-name"
   tags = {
      Environment = "dev"
      Owner = "Spandan Dutta"
   }  
}