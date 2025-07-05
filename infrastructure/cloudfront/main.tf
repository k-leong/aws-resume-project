resource "aws_cloudfront_distribution" "s3_distribution" {
  default_root_object = "index.html"
  aliases = [ var.alias ]
  origin {
    domain_name              = var.s3_domain_name
    origin_id                = var.target_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.origin_access_control.id
  }
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.target_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = var.acm_certificate
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }
  enabled = true

  tags = {
    project = "cloud-resume"
  }
}

resource "aws_cloudfront_origin_access_control" "origin_access_control" {
  name                              = "example"
  description                       = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}