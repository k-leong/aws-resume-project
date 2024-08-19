output "apigateway_url" {
  value = aws_apigatewayv2_api.example.api_endpoint
}

output "apigateway_arn" {
  value = aws_apigatewayv2_api.example.execution_arn
}

output "apigateway_route" {
  value = aws_apigatewayv2_route.example.route_key
}