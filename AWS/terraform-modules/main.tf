provider "aws" {
    region = "ap-south-1"
}

module "jhooq-webserver-1" {
    source = ".//ec2-module-1"
}

module "jhooq-webserver-2" {
    source = ".//ec2-module-2"
}
