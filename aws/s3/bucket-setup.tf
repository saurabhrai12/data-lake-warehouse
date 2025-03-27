resource "aws_s3_bucket" "data_lake_bucket" {
  bucket = "your-unique-bucket-name"
  acl    = "private"

  tags = {
    Name        = "DataLakeBucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "data_lake_bucket_versioning" {
  bucket = aws_s3_bucket.data_lake_bucket.id

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "data_lake_bucket_policy" {
  bucket = aws_s3_bucket.data_lake_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.data_lake_bucket.arn}/*"
      }
    ]
  })
}