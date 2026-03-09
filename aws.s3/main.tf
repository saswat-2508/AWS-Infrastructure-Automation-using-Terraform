provider "aws" {
    region = "ap-south-2"
  
}
resource "aws_s3_bucket" "one" {
  bucket = "saswat-073"
  force_destroy = true
}
resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.one.bucket
  source = "./myname.txt"
  key = "myname.txt"
}
resource "aws_s3_object" "bucket-data-one" {
  bucket = aws_s3_bucket.one.bucket
  source = "./mydata.txt"
  key = "mydata.txt"
  
}