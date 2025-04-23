# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.85.0"
    }
  }
  required_version = ">= 1.10.4"
}

provider "azurerm" {
  features {}
  subscription_id = "5fc4702d-df2f-4cca-9680-1a88751a2464"
}

# Define a variable for tags
variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    ambiente = "workshop"
    projeto  = "exemplo01"
  }
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-caiocqueiroz-exe"
  location = "brazilsouth"
  tags     = var.tags
}

# Create the Linux App Service Plan in Free tier
resource "azurerm_service_plan" "appserviceplan" {
  name                = "plan-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"  # Free tier
  tags                = var.tags
  
  timeouts {
    create = "30m"
    delete = "30m"
  }
}

# Create the web app with a simple configuration
resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  
  site_config {
    application_stack {
      php_version = "8.2"
    }
    always_on = false
  }
  
  tags = var.tags
  
  depends_on = [azurerm_service_plan.appserviceplan]
}

# Create the web app with a simple configuration
resource "azurerm_linux_web_app" "webapp02" {
  name                = "webapp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  
  site_config {
    application_stack {
      php_version = "8.2"
    }
    always_on = false
  }
  
  tags = var.tags
  
  depends_on = [azurerm_service_plan.appserviceplan]
}

# Output the web app URL
output "webapp_url" {
  value = "https://${azurerm_linux_web_app.webapp.default_hostname}"
}