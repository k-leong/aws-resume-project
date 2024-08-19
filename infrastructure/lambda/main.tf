data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../backend/lambda_function.py"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "visitor_count_lambda" {
  function_name = "visitor_count_lambda"
  role          = var.iam_role
  filename      = "lambda.zip"
  handler       = "lambda.lambda_handler"
  runtime       = "python3.10"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.visitor_count_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.apigateway_permission}/*"
}