variable "web_app_name" {
  description = "Web app name."
  type        = string
  default     = "webApp-${substr(md5(random_id.random_id.hex), 0, 8)}"
}

variable "location" {
  description = "Location for all resources."
  type        = string
  default     = "eastus"
}

variable "sku" {
  description = "The SKU of App Service Plan."
  type        = string
  default     = "F1"
}

variable "linux_fx_version" {
  description = "The Runtime stack of current web app"
  type        = string
  default     = "DOTNETCORE|3.0"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "AppServicePlan-${var.web_app_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku {
    tier = var.sku
    size = "F1"
  }
  kind        = "Linux"
  reserved    = true
}

resource "azurerm_web_app" "web_app" {
  name                = "WebAppExample"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  site_config {
    linux_fx_version = var.linux_fx_version
    min_tls_version  = "1.2"
    ftps_state       = "FtpsOnly"
  }
  identity {
    type = "SystemAssigned"
  }
}

output "web_app_url" {
  value = "https://${azurerm_web_app.web_app.default_site_hostname}"
}