resource "aws_dynamodb_table" "VisitorCount" {
name = "VisitorCount"
billing_mode = "PAY_PER_REQUEST"

attribute {
  name = "count"
  type = "N"
}
}