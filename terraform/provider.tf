terraform {
  required_version = ">= 0.13"
  backend "azurerm" {
  }

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>1.6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.76.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.58.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~>3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>3.1.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#purge_soft_delete_on_destroy
      recover_soft_deleted_key_vaults = false # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#recover_soft_deleted_key_vaults
    }
  }
}