output "domain_name" {
  value = aws_acm_certificate.resume_cert.domain_name
}

output "arn" {
  value = aws_acm_certificate.resume_cert.arn
}