output "apigateway_url" {
  value = aws_apigatewayv2_api.get_visitor.api_endpoint
}

output "apigateway_arn" {
  value = aws_apigatewayv2_api.get_visitor.execution_arn
}

output "apigateway_route" {
  value = aws_apigatewayv2_route.get_visitor_route.route_key
}