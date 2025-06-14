terraform {
  backend "s3" {
    bucket = "my-111202020-bucket"
    key    = "spandan/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}
