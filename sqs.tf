resource "aws_sqs_queue" "main" {
  name = format("%s", var.project_name)

  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "dlq" {
  name                      = format("%s-dlq", var.project_name)
  message_retention_seconds = 86400
}
