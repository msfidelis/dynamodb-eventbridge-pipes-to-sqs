<h1 align="center">How to setup EventBridge Pipes to send New DynamoDB Itens do SQS 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-v0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="/" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="/LICENSE " target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/fidelissauro" target="_blank">
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