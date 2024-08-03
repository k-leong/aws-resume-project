output "iam_for_lambda" {
  value = aws_iam_role.iam_for_lambda.arn
}

output "iam_for_apig" {
  value = aws_iam_role.iam_for_apig.arn
}