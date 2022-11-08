#!/usr/bin/env bash

set -e
set -v

S3_NAME=aws-refresh-tfstate-s3
DYNAMODB_NAME=aws-refresh-tfstate-dynamodb
REGION=us-west-2

aws s3api delete-bucket --bucket $S3_NAME --region $REGION

aws dynamodb delete-table --table-name $DYNAMODB_NAME