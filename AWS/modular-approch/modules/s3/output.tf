output "bucket_name" {
   description = "This is the name of the S3 bucket"
   value = aws_s3_bucket.my-s3-bucket.id
}