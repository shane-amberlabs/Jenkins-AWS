#!/usr/bin/env bash

set -e
set -v

S3_NAME=aws-refresh-tfstate-s3
DYNAMODB_NAME=aws-refresh-tfstate-dynamodb
REGION=us-west-2

aws s3 mb s3://$S3_NAME --region $REGION

aws s3api put-public-access-block --bucket $S3_NAME --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" --region $REGION

aws s3api put-bucket-versioning --bucket $S3_NAME --versioning-configuration "Status=Enabled" --region $REGION

aws dynamodb create-table --table-name $DYNAMODB_NAME --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region $REGION