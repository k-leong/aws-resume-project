terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_acm_certificate" "resume_cert" {
  domain_name = "kennyleong-resume.com"

  tags = {
    project = "cloud-resume"
  }
}