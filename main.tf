provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucketoafvubdeoufbao" {
  bucket = "my-example-bucketoafvubdeoufbao"
  acl    = "private"
}

resource "aws_s3_bucket_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.bucket
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
        Effect = "Deny"
        Action = "s3:DeleteObject"
        Resource = "${aws_s3_bucket.example_bucket.arn}/*"
        Principal = "*"
      }
    ]
  })
}
