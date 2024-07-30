resource "awscc_pipes_pipe" "main" {
  name = format("%s-event-bridge", var.project_name)

  source   = "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.current.account_id}:table/${aws_dynamodb_table.main.name}/stream/${aws_dynamodb_table.main.stream_label}"
  role_arn = aws_iam_role.eventbridge_pipes_role.arn

  source_parameters = {
    dynamo_db_stream_parameters = {
      batch_size = var.eventbridge_pipe_sqs_batch_size
      dead_letter_config = {
        arn = aws_sqs_queue.main.arn
      }
      maximum_batching_window_in_seconds = var.eventbridge_pipe_sqs_batch_timeout_in_seconds
      starting_position                  = "TRIM_HORIZON"
    }
    // Filtrando somente os eventos de INSERT
    filter_criteria = {
      filters = [
        { pattern = "{ \"eventName\": [\"INSERT\"]}" }
      ]
    }
  }

  target = aws_sqs_queue.main.arn

  lifecycle {
    ignore_changes = [
      source_parameters.dynamo_db_stream_parameters.starting_position
    ]
  }
}