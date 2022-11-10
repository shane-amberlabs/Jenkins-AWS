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


### The block below will configure Terraform to use the S3 to store the statefile, add it to the 'provider.tf' file

`terraform {`
  `backend "s3" {`
    `bucket = <<NAME>>`
    `key    = "terraform.tfstate"`
    `dynamodb_table = <<NAME>>`
    `encrypt = true`
    `region = <<REGION>>`
  `}`
`}`

## AWS Infrastructure

**The Terraform folder contains files that will build all the required resources for a Kubernetes cluster.**
- VPC (Virtual Private Cloud)
- Subnets
    - 2 x Private
    - 2 x Public
- Internet Gateway
- 2 x NAT Gateways
- 3 x Routing tables
    4 x Route Table Associations
- 2 x Elastic IPs
- EKS (Elastic Kubernetes Service) Cluster
    - EKS Role, Policy and Policy Attachment 
- EKS (Elastic Kubernetes Service) Node Group
    - Role, Policy and Policy Attachment 

**The steps to connect to the EKS service once its deployed are:**

- Add the user contect to kubectl
    - `aws eks --region <<REGION>> update-kubeconfig --name <<EKS_NAME>>` This should be ran with the profile that created the EKS service.

- Access EKS service
    - `kubectl get svc`

**There is a basic app example at `/workspaces/Jenkins-AWS/k8s/app.yaml`. The steps to deploy this as a test are:**

- Create the pods and start the service:
    - `kubectl apply -f /workspaces/Jenkins-AWS/k8s/app.yaml`

- View the pods that were started:
    - `kubectl get pods`

- View the services:
    - `kubectl get svc`

- View additional details about the service:
    - `kubectl describe svc <<NAME_OF_SERVICE>>`

- You can retrive the IP of the service (if it doesnt appear using the above commands) through the console and navigating to the Load Balancer.

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


## Notes*
The clock within the devcontainer can get out of sync and cause issues when deploying to AWS. 
To realign the time with the Windows machine, run: `hwclock -s`
