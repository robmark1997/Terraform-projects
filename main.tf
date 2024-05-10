#create a bucket with public access and versioning

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-tf-example-bucket-gsingh"
}

resource "aws_s3_bucket_ownership_controls" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "my-bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my-bucket,
    aws_s3_bucket_public_access_block.my-bucket,
  ]

  bucket = aws_s3_bucket.my-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}