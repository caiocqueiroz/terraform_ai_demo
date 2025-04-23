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
  subscription_id = "e84af34a-bbd2-4d60-8776-829485d3e735"
}

# Define a variable for tags
variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    ambiente = "workshop"
    projeto  = "exe01"
  }
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-exe01"
  location = "eastus"
  tags     = var.tags
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "plan-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
  tags                = var.tags
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                                           = "webapp-${random_integer.ri.result}"
  location                                       = azurerm_resource_group.rg.location
  resource_group_name                            = azurerm_resource_group.rg.name
  service_plan_id                                = azurerm_service_plan.appserviceplan.id
  https_only                                     = true
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  site_config {
    minimum_tls_version = "1.2"
  }
  tags = var.tags
}

output "web_app_url" {
  value = "https://${azurerm_linux_web_app.webapp.default_hostname}"
}