# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = var.tags
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "plan-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = var.environment == "dev" ? "B1" : var.environment == "hml" ? "S1" : "P1v2"
  tags                = var.tags
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                                           = "webapp-${var.project_name}-${var.environment}"
  location                                       = azurerm_resource_group.rg.location
  resource_group_name                            = azurerm_resource_group.rg.name
  service_plan_id                                = azurerm_service_plan.appserviceplan.id
  https_only                                     = true
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  tags                                           = var.tags
  site_config {
    minimum_tls_version = "1.2"
  }
}