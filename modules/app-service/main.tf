resource "azurerm_linux_web_app" "webapp" {
  name                                           = "app-${var.webapp_name}"
  location                                       = var.location
  resource_group_name                            = var.rg_name
  service_plan_id                                = var.plan_id
  https_only                                     = true
  tags                                           = var.az_tags
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      dotnet_version = "7.0"
    }
  }
}