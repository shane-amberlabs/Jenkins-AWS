
vpc_id = {
  devt = "vpc-99ad6bf1"
  test = "vpc-e1cf0989"
  stag = "vpc-25c40e4d"
  prod = "vpc-0cc40e64"
}

subnet_id = {
  devt = ["subnet-be1020f3"]
  test = ["subnet-7577940f"]
  stag = ["subnet-953a01d8"]
  prod = ["subnet-010e6c3412b2beab7"]
}

subnet_cidr = {
  devt = ["10.84.236.0/24"]
  test = ["10.84.243.0/24"]
  stag = ["10.94.244.0/24"]
  prod = ["10.94.253.0/24"]
}

proxy_ip = {
  sbox = "10.88.32.40"
  devt = "10.89.32.40"
  test = "10.102.32.40"
  stag = "10.103.32.40"
  prod = "10.105.32.40"
}

aws_account_id = {
  devt = "431469937388"
  test = "431469937388"
  stag = "803617926694"
  prod = "803617926694"
}

pip_acc_mgr_sqs_queue_arn = {
  devt = "arn:aws:sqs:eu-west-2:431469937388:fha-pip-dev-pip_account_analytics_stream"
  test = "arn:aws:sqs:eu-west-2:431469937388:fha-pip-qa-pip_account_analytics_stream"
  stag = "arn:aws:sqs:eu-west-2:803617926694:fha-pip-staging-pip_account_analytics_stream"
  prod = "arn:aws:sqs:eu-west-2:803617926694:fha-pip-live-pip_account_analytics_stream"
}

pip_clm_mgr_sqs_queue_arn = {
  devt = "arn:aws:sqs:eu-west-2:431469937388:fha-pip-dev-pip_claim_analytics_stream"
  test = "arn:aws:sqs:eu-west-2:431469937388:fha-pip-qa-pip_claim_analytics_stream"
  stag = "arn:aws:sqs:eu-west-2:803617926694:fha-pip-staging-pip_claim_analytics_stream"
  prod = "arn:aws:sqs:eu-west-2:803617926694:fha-pip-live-pip_claim_analytics_stream"
}

pip_data_stream_kms_key = {
  devt = "arn:aws:kms:eu-west-2:431469937388:key/9beb645b-2239-44da-a42d-8b526a825f95"
  test = "arn:aws:kms:eu-west-2:431469937388:key/af7383b3-2b46-4197-ba0a-779da8f3e27c"
  stag = "arn:aws:kms:eu-west-2:803617926694:key/e1813ffe-e8b7-4f18-8e38-c9f53095f3cd"
  prod = "arn:aws:kms:eu-west-2:803617926694:key/1f894239-4932-4dce-86c3-c412e290cca5"
}

atw_cse_hnd_data_stream_kms_key = {
  devt = "arn:aws:kms:eu-west-2:431469937388:key/b2368420-b0bc-4dfb-8600-8dc1179d8483"
  test = "arn:aws:kms:eu-west-2:431469937388:key/b2368420-b0bc-4dfb-8600-8dc1179d8483"
  stag = "arn:aws:kms:eu-west-2:803617926694:key/544998e0-b1e2-42c8-9ed6-b8a7255d3a39"
  prod = "arn:aws:kms:eu-west-2:803617926694:key/1be7551f-0d75-4669-9e5c-6bb286948d46"
}

atw_corr_data_stream_kms_key = {
  devt = "arn:aws:kms:eu-west-2:431469937388:key/be05853b-4f5e-4112-bc87-9e8a0886ba41"
  test = "arn:aws:kms:eu-west-2:431469937388:key/be05853b-4f5e-4112-bc87-9e8a0886ba41"
  stag = "UPDATE"
  prod = "UPDATE"
}

sop_pay_serv_data_stream_kms_key = {
  devt = "arn:aws:kms:eu-west-2:431469937388:key/d8bf26a2-5305-43a4-8438-2819abf7ac37"
  test = "arn:aws:kms:eu-west-2:431469937388:key/d8bf26a2-5305-43a4-8438-2819abf7ac37"
  stag = "UPDATE"
  prod = "UPDATE"
}

atw_sns_topic_arn = {
  devt = "arn:aws:sns:eu-west-2:431469937388:atw-f-67-persistent-cdc-event"
  test = "arn:aws:sns:eu-west-2:431469937388:atw-f-67-persistent-cdc-event"
  stag = "arn:aws:sns:eu-west-2:803617926694:atw-stage-persistent-cdc-event"
  prod = "arn:aws:sns:eu-west-2:803617926694:atw-prod-persistent-cdc-event"
}

# Networking
network_resource_group_name = {
  devt = "rg-uks-devt-ch-hds-network"
  test = "rg-uks-test-ch-hds-network"
  stag = "rg-uks-stag-ch-hds-network"
  prod = "rg-uks-prod-ch-hds-network"
}

vnet_name = {
  devt = "vnet-uks-devt-ch-hds"
  test = "vnet-uks-test-ch-hds"
  stag = "vnet-uks-stag-ch-hds"
  prod = "vnet-uks-prod-ch-hds"
}

# Key Vault
kv_base_name = {
  devt = "kv-uks-devt-ch-hds"
  test = "kv-uks-test-ch-hds"
  stag = "kv-uks-stag-ch-hds"
  prod = "kv-uks-prod-ch-hds"
}

kv_rg_name = {
  devt = "rg-uks-devt-ch-hds-core"
  test = "rg-uks-test-ch-hds-core"
  stag = "rg-uks-stag-ch-hds-core"
  prod = "rg-uks-prod-ch-hds-core"
}

storage_account_name = {
  devt = "struksdevtchhdsadfdev"
  test = "strukstestchhdshdaap"
  stag = "struksstagchhdshdaap"
  prod = "struksprodchhdshdaap"
}

build_id = {
  devt = "adfdev"
  test = "hdaap"
  stag = "hdaap"
  prod = "hdaap"
}

tags = {
  devt = { Application = "Devt HDAAP", Product = "data-platform", Function = "Health + Working Age", Environment = "Dev", Persistence = "NOT SET", Role = "Devt Test Role Tag", Spot_enabled = "True or False" }
  test = { Application = "Test HDAAP", Product = "data-platform", Function = "Health + Working Age", Environment = "Test", Persistence = "NOT SET", Role = "Test Role Tag", Spot_enabled = "True or False" }
  stag = { Application = "Stag HDAAP", Product = "data-platform", Function = "Health + Working Age", Environment = "Stage", Persistence = "NOT SET", Role = "Stag Role Tag", Spot_enabled = "True or False" }
  prod = { Application = "Prod HDAAP", Product = "data-platform", Function = "Health + Working Age", Environment = "Prod", Persistence = "NOT SET", Role = "Prod Role Tag", Spot_enabled = "True or False" }
}

vm_key = {
  devt = "NONPROD_MASTER"
  test = "NONPROD_MASTER"
  stag = "PROD_MASTER"
  prod = "PROD_MASTER"
}

lambda_package = {
  devt = "artifact/data-platform/aws-data-bridge-lambda/develop/data-bridge-lambda.zip"
  test = "artifact/data-platform/aws-data-bridge-lambda/develop/data-bridge-lambda.zip"
  stag = "artifact/data-platform/aws-data-bridge-lambda/r-0-0-3/data-bridge-lambda.zip"
  prod = "artifact/data-platform/aws-data-bridge-lambda/r-0-0-3/data-bridge-lambda.zip"
}

artifact_bucket = {
  devt = "health-nonprod-artifact"
  test = "health-nonprod-artifact"
  stag = "health-prod-artifact"
  prod = "health-prod-artifact"
}

account_type = {
  devt = "nonprod"
  test = "nonprod"
  stag = "prod"
  prod = "prod"
}

bastion_sg = {
  devt = ["sg-05991e9a7f68bb2c0"]
  test = ["sg-05991e9a7f68bb2c0"]
  stag = ["sg-0c99314583518b9a2"]
  prod = ["sg-0c99314583518b9a2"]
}

deploy_atw_casehandler = {
  sbox = false
  devt = false
  test = false
  stag = true
  prod = true
}

deploy_atw_correspondence = {
  sbox = false
  devt = false
  test = true
  stag = true
  prod = true
}

deploy_sop_payment_service = {
  sbox = false
  devt = false
  test = true
  stag = true
  prod = true
}

deploy_pip_account = {
  sbox = false
  devt = true
  test = true
  stag = true
  prod = true
}

deploy_pip_claim = {
  sbox = false
  devt = true
  test = true
  stag = true
  prod = true
}

instance_type = {
  sbox = "t2.small"
  devt = "t2.medium"
  test = "t2.medium"
  stag = "t2.medium"
  prod = "c5.2xlarge"
}

min_shir_nodes = {
  sbox = 1
  devt = 1
  test = 1
  stag = 1
  prod = 1
}

max_shir_nodes = {
  sbox = 1
  devt = 1
  test = 1
  stag = 1
  prod = 1
}

desired_shir_nodes = {
  sbox = 1
  devt = 1
  test = 1
  stag = 1
  prod = 1
}

connect_alerts_to_bmc = {
  sbox = false
  devt = false
  test = false
  stag = false
  prod = false
}

deploy_action_group = {
  sbox = false
  devt = false
  test = true
  stag = true
  prod = true
}

deploy_alerts = {
  sbox = false
  devt = false
  test = true
  stag = true
  prod = true
}

