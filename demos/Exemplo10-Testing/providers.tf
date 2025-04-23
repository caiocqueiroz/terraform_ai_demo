# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.15.0"
    }
  }
  required_version = ">= 1.10.4"
}

provider "azurerm" {
  features {}
}