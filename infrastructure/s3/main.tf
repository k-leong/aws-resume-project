resource "aws_s3_bucket" "cloud_resume_bucket" {
  bucket = "kennyleong-resume-bucket"

  tags = {
    Name = "resume bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "cloud_resume_bucket_website" {
  bucket = aws_s3_bucket.cloud_resume_bucket.id

  index_document {
    suffix = "index.html"
  }
}