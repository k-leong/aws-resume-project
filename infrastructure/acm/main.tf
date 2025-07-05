resource "aws_acm_certificate" "resume_cert" {
  domain_name = "kennyleong-resume.com"

  tags = {
    project = "cloud-resume"
  }
}