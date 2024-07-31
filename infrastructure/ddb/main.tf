resource "aws_dynamodb_table" "VisitorCount" {
  name         = "VisitorCount"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "count"

  attribute {
    name = "count"
    type = "N"
  }
}