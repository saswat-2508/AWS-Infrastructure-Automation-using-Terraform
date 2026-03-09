provider "aws" {
    region = "ap-south-2"
  
}
resource "aws_s3_bucket" "myapp" {
  bucket = "saswat-2508"
}

resource "aws_s3_bucket_policy" "myapp" {
  bucket = aws_s3_bucket.myapp.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.myapp.arn}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_public_access_block" "example" {
    bucket = aws_s3_bucket.myapp.bucket

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false 
    restrict_public_buckets = false 
  
}

resource "aws_s3_bucket_website_configuration" "web" {
    bucket = aws_s3_bucket.myapp.bucket
    index_document {
      suffix = "index.html"
    }
  
}

resource "aws_s3_object" "index-html" {
  bucket = aws_s3_bucket.myapp.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}

output "s3_bucket_url" {
  value ="https://$(aws_s3_bucket.myapp.bucket).s3-website-ap-aouth-2.amazonaws.com"
  
}