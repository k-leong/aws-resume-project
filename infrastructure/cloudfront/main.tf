resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.domain_name
    origin_id = var.domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.origin_access_control.id
  }
  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = var.target_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations = []
    }
  }
  enabled = true
}

resource "aws_cloudfront_origin_access_control" "origin_access_control" {
  name = "example"
  description = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}