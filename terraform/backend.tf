terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
  backend "azurerm" {
    config = {
      storage_account_name = "jkrilovtfstate"
      container_name       = "state"
      key                  = "terraform.tfstate"
    }
  }
}

provider "azurerm" {
  subscription_id            = "2608623e-326e-4765-95fc-b8f65a5c3cb1"
  tenant_id                  = "d1993901-bb51-492f-8e0d-572b1384f3a6"
  client_id                  = "7044decd-d37e-4fe5-a25f-dcb2ea341213"
  client_secret              = var.client_secret
  skip_provider_registration = true
  features {}
}
