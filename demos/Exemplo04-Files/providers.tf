# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.15.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-treinamento-terraform"
    storage_account_name = "strtreinamentoterraform"
    container_name       = "tfstate"
    key                  = "exemplo04.tfstate"
  }
  required_version = ">= 1.10.4"
}

provider "azurerm" {
  features {}
}