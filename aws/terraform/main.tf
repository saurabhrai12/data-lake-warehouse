provider "aws" {
  region = "us-west-2"  # Specify your desired AWS region
}

resource "aws_s3_bucket" "data_lake_bucket" {
  bucket = "my-data-lake-bucket"  # Replace with your desired bucket name
  acl    = "private"

  tags = {
    Name        = "Data Lake Bucket"
    Environment = "Production"
  }
}

resource "aws_lambda_function" "data_processing_lambda" {
  function_name = "dataProcessingFunction"
  s3_bucket     = aws_s3_bucket.data_lake_bucket.bucket
  s3_key        = "lambda/handler.zip"  # Path to your zipped Lambda function code
  handler       = "handler.lambda_handler"  # Adjust based on your handler function
  runtime       = "python3.8"  # Specify the runtime for your Lambda function

  environment {
    # Add any environment variables your Lambda function needs
    VAR_NAME = "value"
  }

  tags = {
    Name        = "Data Processing Lambda"
    Environment = "Production"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.data_lake_bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.data_processing_lambda.function_name
}