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
  skip_provider_registration = true
  features {}
}
