output "apigateway_url" {
  value = module.apigateway.apigateway_url
  sensitive = true
}

output "apigateway_route" {
  value = module.apigateway.apigateway_route
  sensitive = true
}

# output "aws_s3_bucket" {
#   value = module.s3.aws_s3_bucket
#   sensitive = true
# }