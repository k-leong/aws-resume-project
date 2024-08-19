output "apigateway_url" {
  value = module.apigateway.apigateway_url
}

output "apigateway_route" {
  value = module.apigateway.apigateway_route
}

output "aws_s3_bucket" {
  value = module.s3.aws_s3_bucket
}