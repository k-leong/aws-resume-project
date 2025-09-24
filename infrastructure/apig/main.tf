resource "aws_apigatewayv2_api" "get_visitor" {
  name          = "get_visitor_api"
  protocol_type = "HTTP"

  tags = {
    project = "cloud-resume"
  }
}

resource "aws_apigatewayv2_integration" "get_visitor_integration" {
  api_id           = aws_apigatewayv2_api.get_visitor.id
  integration_type = "AWS_PROXY"

  description            = "apigateway lambda integrator"
  integration_method     = "GET"
  integration_uri        = var.lambda_function_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_stage" "get_visitor_stage" {
  api_id = aws_apigatewayv2_api.get_visitor.id
  name   = "$default"
  access_log_settings {
    destination_arn = var.cloudwatch_log_group
    format = jsonencode({
      requestId          = "$context.requestId"
      extendedRequestId  = "$context.extendedRequestId"
      sourceIp           = "$context.identity.sourceIp"
      requestTime        = "$context.requestTime"
      status             = "$context.status"
      errorMessage       = "$context.error.message"
      errorMessageString = "$context.error.messageString"
      integrationStatus  = "$context.integration.integrationStatus"
    })
  }

  auto_deploy = true
}

resource "aws_apigatewayv2_deployment" "get_visitor_deployment" {
  api_id      = aws_apigatewayv2_api.get_visitor.id
  description = "apigateway deployment"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_apigatewayv2_route.get_visitor_route]
}

resource "aws_apigatewayv2_route" "get_visitor_route" {
  api_id    = aws_apigatewayv2_api.get_visitor.id
  route_key = "GET /get-visitor"

  target = "integrations/${aws_apigatewayv2_integration.get_visitor_integration.id}"
}

resource "aws_api_gateway_account" "get_visitor_account" {
  cloudwatch_role_arn = var.cloudwatch_role_arn
}