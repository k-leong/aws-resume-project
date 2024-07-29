data "archive_file" "lambda_zip" {
  type = "zip"
  source_file = "../backend/lambda.py"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "visitor_count_lambda" {
  function_name = "visitor_count_lambda"
  role = var.iam_role
  filename = "lambda.zip"
  handler = "lambda.lambda_handler"
  runtime = "python3.10"
}