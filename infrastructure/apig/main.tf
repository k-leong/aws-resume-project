resource "aws_apigatewayv2_api" "example" {
  name          = "example-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "example" {
  api_id           = aws_apigatewayv2_api.example.id
  integration_type = "AWS_PROXY"

  description     = "apigateway lambda integrator"
  integration_method = "GET"
  integration_uri = var.lambda_function_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_stage" "example" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "$default"

  auto_deploy = true
}

resource "aws_apigatewayv2_deployment" "example" {
  api_id      = aws_apigatewayv2_api.example.id
  description = "apigateway deployment"

  lifecycle {
    create_before_destroy = true
  }
  
  depends_on = [ aws_apigatewayv2_route.example ]
}

resource "aws_apigatewayv2_route" "example" {
  api_id = aws_apigatewayv2_api.example.id
  route_key = "GET /get-visitor"

  target = "integrations/${aws_apigatewayv2_integration.example.id}"
}

# resource "aws_api_gateway_account" "example" {
#   cloudwatch_role_arn = var.cloudwatch_role_arn
# }