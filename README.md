# Jenkins-AWS

## Terraform (AWS)

### There are 2 scripts to configure the S3 for the statefile:
- `/scripts/create-state-s3.sh`
    - This script will create the S3 bucket, add versioning, access block and DynamoDB table.

- `/scripts/destroy-state-s3.sh`
    - This script will destroy the S3 bucket, add versioning, access block and DynamoDB table.

### The individual steps are below. 

AWS Credentials:
- Run the 'aws-creds.sh' script, ensuring the credentials are correct. 
    - DO NOT commit these into source control. 
    - Ideally these will be pulled from a key store. 

- Create a bucket for the state file:
    - `aws s3 mb s3://<<NAME>> --region <<REGION>>`

- Set the public access block:
    - `aws s3api put-public-access-block --bucket <<NAME>> --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" --region <<REGION>>`

- Enable versioning on the bucket:
    - `aws s3api put-bucket-versioning --bucket <<NAME>> --versioning-configuration "Status=Enabled" --region <<REGION>>`


**While terraform uses S3 to store the actual state, it needs some locking mechanism that S3 does not provide. This is done via DynamoDB. The table must have a primary key named LockID as a string.**

- Create the DynamoDB table:
    - `aws dynamodb create-table --table-name <<NAME>> --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region <<REGION>>`


### The block below will configure Terraform to use the S3 to store the statefile. 

`terraform {`
  `backend "s3" {`
    `bucket = <<NAME>>`
    `key    = "terraform.tfstate"`
    `dynamodb_table = <<NAME>>`
    `encrypt = true`
    `region = <<REGION>>`
  `}`
`}`

## Jenkins

### The steps below outline how to set up and host a jenkins instance in Docker. 

1. Build the Jenkins Docker image:
    - `docker build -t myjenkins-blueocean:2.332.3-1 .`

2. Create the Jenkins network:
    - `docker network create jenkins`

3. Run the container:
    - Windows: `docker run --name jenkins-blueocean --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.332.3-1`

    - Linux/Mac: `docker run --name jenkins-blueocean --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro myjenkins-blueocean:2.332.3-1`

4. Get the password:
    - `docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword`

5. Connect to Jenkins:
    - `http://localhost:8080/`