
resource "random_string" "secrets_suffix" {
  length  = 3
  special = false
}

# S3 Bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sawtfs3bucket"

  tags = {
    Name        = "sawtfs3bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}
