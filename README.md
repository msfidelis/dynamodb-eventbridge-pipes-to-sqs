<!-- BEGIN_TF_DOCS -->
<h1 align="center">How to setup EventBridge Pipes to send New DynamoDB Itens do SQS 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-v0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="/" target="\_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="/LICENSE " target="\_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/fidelissauro" target="\_blank">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" />
  </a>
</p>

### 🏠 [Architecture / Topology](/)

![topology](.github/asserts/scale.png
## DynamoDB Stream Event Example

```json
{
    "eventID": "a8f715d304a8daab894872742a3855b7",
    "eventName": "INSERT",
    "eventVersion": "1.1",
    "eventSource": "aws:dynamodb",
    "awsRegion": "us-east-1",
    "dynamodb": {
        "ApproximateCreationDateTime": 1722360292,
        "Keys": {
            "id": {
                "S": "a40d1614-5234-4ef2-aa6a-c25c3b5c58a3"
            }
        },
        "NewImage": {
            "id": {
                "S": "a40d1614-5234-4ef2-aa6a-c25c3b5c58a3"
            }
        },
        "SequenceNumber": "100000000093582842803",
        "SizeBytes": 76,
        "StreamViewType": "NEW_IMAGE"
    },
    "eventSourceARN": "arn:aws:dynamodb:us-east-1:181560427716:table/stream-pipe/stream/2024-07-30T17:20:48.118"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | 1.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_policy.eventbridge_pipes_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.eventbridge_pipes_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.eventbridge_pipes_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [awscc_pipes_pipe.main](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/pipes_pipe) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eventbridge_pipe_sqs_batch_size"></a> [eventbridge\_pipe\_sqs\_batch\_size](#input\_eventbridge\_pipe\_sqs\_batch\_size) | n/a | `number` | `10` | no |
| <a name="input_eventbridge_pipe_sqs_batch_timeout_in_seconds"></a> [eventbridge\_pipe\_sqs\_batch\_timeout\_in\_seconds](#input\_eventbridge\_pipe\_sqs\_batch\_timeout\_in\_seconds) | n/a | `number` | `10` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"stream-pipe"` | no |

## Outputs

No outputs.

### ✨ [Demo](/)

## Install

```sh
terraform apply
```

## Usage

```sh
terraform apply
```

## Run tests

```sh
terraform plan
```

## Author

👤 **Matheus Fidelis**

* Website: https://fidelissauro.dev
* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)
* LinkedIn: [@msfidelis](https://linkedin.com/in/msfidelis)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2021 [Matheus Fidelis](https://github.com/msfidelis).<br />
This project is [MIT](/LICENSE ) licensed.

***
\_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)\_
<!-- END_TF_DOCS -->