resource "aws_s3_bucket" "cloud_resume_bucket" {
  bucket = "kennyleong-resume-bucket"

  tags = {
    Name = "resume bucket"
  }
}

resource "aws_s3_bucket_policy" "allow_cloudfront_to_s3_bucket" {
  bucket = aws_s3_bucket.cloud_resume_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.cloud_resume_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "aws:SourceArn" = "${var.cloudfront_dist_arn}"
          }
        }
      }
    ]
  })
}
