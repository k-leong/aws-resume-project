resource "aws_acm_certificate" "resume_cert" {
  domain_name = "kennyleong-resume.com"
  region      = "us-east-1"

  tags = {
    project = "cloud-resume"
  }
}