# Jenkins-AWS

# There are 2 scripts to configure the S3 for the statefile:
- /scripts/create-state-s3.sh 
    - This script will create the S3 bucket, add versioning, access block and DynamoDB table.

- /scripts/destroy-state-s3.sh 
    - This script will destroy the S3 bucket, add versioning, access block and DynamoDB table.

# The individual steps are below. 

AWS Credentials:
- Run the 'aws-creds.sh' script, ensuring the credentials are correct. 
    - DO NOT commit these into source control. 
    - Ideally these will be pulled from a key store. 

- Create a bucket for the state file:
    - aws s3 mb s3://<<NAME>> --region <<REGION>>

- Set the public access block:
    - aws s3api put-public-access-block --bucket <<NAME>> --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" --region <<REGION>>

- Enable versioning on the bucket:
    - aws s3api put-bucket-versioning --bucket <<NAME>> --versioning-configuration "Status=Enabled" --region <<REGION>>


# While terraform uses S3 to store the actual state, it needs some locking mechanism that S3 does not provide. This is done via DynamoDB. The table must have a primary key named LockID as a string.

- Create the DynamoDB table:
    - aws dynamodb create-table --table-name <<NAME>> --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region <<REGION>>


# The block below will configure Terraform to use the S3 to store the statefile. 

terraform {
  backend "s3" {
    bucket = <<NAME>>
    key    = "terraform.tfstate"
    dynamodb_table = <<NAME>>
    encrypt = true
    region = <<REGION>>
  }
}