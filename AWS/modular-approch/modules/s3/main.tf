resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = var.bucket_name
    tags = var.tags
}

resource "aws_s3_bucket_ownership_controls" "my-s3-aws_s3_bucket_ownership_controls" {
    bucket = aws_s3_bucket.my-s3-bucket.id

    rule {
        object_ownership = "BucketOwnerPreferred"
    }

}

resource "aws_s3_bucket_public_access_block" "my-aws_s3_bucket_public_access_block" {
    bucket = aws_s3_bucket.my-s3-bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  
}