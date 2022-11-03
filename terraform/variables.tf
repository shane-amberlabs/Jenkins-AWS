
variable "subscription_name" {
  description = "Subscription Name"
  type        = string
}

variable "account_type" {
  description = "The type of account, PROD or NONPROD"
  type        = map(any)
}

variable "pdu" {
  type        = string
  description = "The abbreviated name of the PDU"
  default     = "ch-hds"
}

variable "product" {
  type        = string
  description = "The name of the product the code will produce"
  default     = "data-platform"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "uksouth"
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID"
  default     = "96f1f6e9-1057-4117-ac28-80cdfe86f8c3"
  type        = string
}

variable "connect_adf_to_git" {
  description = "Boolean to specify whether or not the ADF instance should be connect to ADO"
  type        = bool
  default     = false
}

variable "network_resource_group_name" {
  description = "The name of the resource group where the network is"
  type        = map(any)
}

variable "vnet_name" {
  description = "The vnet name"
  type        = map(any)
}

variable "kv_base_name" {
  description = "The prefix of the key vault names"
  type        = map(any)
}

variable "kv_rg_name" {
  description = "The prefix of the resource group the key vault is in"
  type        = map(any)
}

variable "proxy_ip" {
  type        = map(any)
  description = "The IP address of the Proxy server hosted in the Azure subscription."
}

variable "storage_account_name" {
  type        = map(any)
  description = "The main block of the naming convention for Storage Account"
}

# AWS Resources
variable "vpc_id" {
  type        = map(any)
  description = "The ID of the AWS Health VPC the Databridge resources will be deployed into."
}

variable "subnet_id" {
  type        = map(any)
  description = "The ID of the AWS Health Subnet the Databridge resources will be deployed into"
}

variable "subnet_cidr" {
  type        = map(any)
  description = "The CIDR Range of the AWS Health Subnet the Databridge resources will be deployed into"
}

variable "pip_acc_mgr_sqs_queue_arn" {
  type        = map(any)
  description = "The ARN of the PIP Apply SQS Account Manager queue"
}

variable "pip_clm_mgr_sqs_queue_arn" {
  type        = map(any)
  description = "The ARN of the PIP Apply SQS Claim Manager queue"
}

variable "pip_data_stream_kms_key" {
  type        = map(any)
  description = "The ARN of the KMS key used to decrypt the PIP Apply Data"
}

variable "atw_cse_hnd_data_stream_kms_key" {
  type        = map(any)
  description = "The ARN of the KMS key used to decrypt the ATW Case Handler Data"
}

variable "atw_corr_data_stream_kms_key" {
  type        = map(any)
  description = "The ARN of the KMS key used to decrypt the ATW Correspondence Data"
}

variable "sop_pay_serv_data_stream_kms_key" {
  type        = map(any)
  description = "The ARN of the KMS key used to decrypt the SOP Payment Service Data"
}

variable "atw_sns_topic_arn" {
  type        = map(any)
  description = "The ARN of the SNS Topic for ATW"
}

variable "ami" {
  description = "The image used for the EC2 instance"
  default     = "ami-029d7254011372403"
  type        = string
}

variable "instance_type" {
  description = "The type and size of the EC2 instance"
  type        = map(any)
}

variable "tags" {
  type        = map(any)
  description = "Tags to be applied to resources for billing purposes"
}

variable "build_id" {
  type        = map(any)
  description = "The ID that will be incorperated into the resource names. This should marry up with the name from the Platform build"
}

variable "vm_key" {
  type        = map(any)
  description = "The name of the Key used to decrypt VM password"
}

variable "lambda_package" {
  type        = map(any)
  description = "The name of the package being pulled containing the lambda code"
}

variable "artifact_bucket" {
  type        = map(any)
  description = "The name of the bucket containing the lambda artifact"
}

variable "aws_account_id" {
  type        = map(any)
  description = "The ID of the AWS account the resources will be deployed into"
}

variable "bastion_sg" {
  type        = map(any)
  description = "The security group the bastion is inside"
}

variable "deploy_atw_casehandler" {
  type        = map(any)
  description = "boolean on whether the Access to Work databridge should deploy"
}

variable "deploy_atw_correspondence" {
  type        = map(any)
  description = "boolean on whether the Access to Work databridge should deploy"
}

variable "deploy_pip_account" {
  type        = map(any)
  description = "boolean on whether the PIP Account databridge should deploy"
}

variable "deploy_pip_claim" {
  type        = map(any)
  description = "boolean on whether the PIP Claim databridge should deploy"
}

variable "deploy_sop_payment_service" {
  type        = map(any)
  description = "boolean on whether the PIP Claim databridge should deploy"
}

variable "max_shir_nodes" {
  type        = map(any)
  description = "Maximum number of SHIR nodes"
}

variable "min_shir_nodes" {
  type        = map(any)
  description = "Minimum number of SHIR nodes"
}

variable "desired_shir_nodes" {
  type        = map(any)
  description = "Desired number of SHIR nodes"
}

variable "connect_alerts_to_bmc" {
  type        = map(any)
  description = "boolean on whether the action group for alerts should be the BMC one or the HDAAP one"
}

variable "deploy_action_group" {
  type        = map(any)
  description = "boolean on whether the action group is created"
}

variable "deploy_alerts" {
  type        = map(any)
  description = "boolean on whether the alerts are created."
}
