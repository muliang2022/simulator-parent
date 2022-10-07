#!/usr/bin/env bash

set -euo pipefail

echo "configuring sqs"
echo "==================="

LOCALSTACK_HOST=localhost

create_queue() {
    local QUEUE_NAME_TO_CREATE=$1
    awslocal --endpoint-url=http://${LOCALSTACK_HOST}:4566 sqs create-queue --queue-name ${QUEUE_NAME_TO_CREATE} --region ${AWS_DEFAULT_REGION} --attributes VisibilityTimeout=30
}

create_queue "settlement-invoice-sqs"