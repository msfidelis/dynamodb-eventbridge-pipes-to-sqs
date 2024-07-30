resource "aws_dynamodb_table" "main" {
  name         = format("%s", var.project_name)
  billing_mode = "PAY_PER_REQUEST"

  hash_key         = "id"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "id"
    type = "S"
  }
}
