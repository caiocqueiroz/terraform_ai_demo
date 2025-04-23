output "web_app_id" {
  value = azurerm_linux_web_app.webapp.id
}

output "web_app_name" {
  value = azurerm_linux_web_app.webapp.name
}

output "web_app_url" {
  value = "https://${azurerm_linux_web_app.webapp.default_hostname}"
}