provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket1234" {
  bucket = "my-example-bucket123er5"
  acl    = "private"
}

resource "aws_s3_bucket_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "example-object"
  source = "path/to/local/file"
  etag   = filemd5("path/to/local/file")
}

resource "aws_s3_bucket_policy" "example_policy" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Deny",
        Action = "s3:DeleteObject",
        Resource = "${aws_s3_bucket.example_bucket.arn}/*",
        Principal = "*"
      }
    ]
  })
}
