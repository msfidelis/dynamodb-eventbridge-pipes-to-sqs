resource "aws_iam_role" "eventbridge_pipes_role" {
  name = format("%s-event-bridge", var.project_name)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "pipes.amazonaws.com"
      }
    }]
  })
}


resource "aws_iam_policy" "eventbridge_pipes_policy" {
  name = format("%s-event-bridge", var.project_name)
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ]
        Resource = aws_dynamodb_table.main.stream_arn
      },
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage"
        ]
        Resource = aws_sqs_queue.main.arn
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eventbridge_pipes_policy_attachment" {
  name       = format("%s-event-bridge", var.project_name)
  policy_arn = aws_iam_policy.eventbridge_pipes_policy.arn
  roles = [
    aws_iam_role.eventbridge_pipes_role.name
  ]
}
