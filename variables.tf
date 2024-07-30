variable "project_name" {
  default = "stream-pipe"
}

variable "eventbridge_pipe_sqs_batch_size" {
  default = 10
}

variable "eventbridge_pipe_sqs_batch_timeout_in_seconds" {
  default = 10
}