resource "azurerm_container_registry" "acr" {
  name                          = "acr${var.acr_name}"
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = var.acr_sku
  admin_enabled                 = false
  public_network_access_enabled = var.acr_sku == "Basic" ? true : false
  tags                          = var.az_tags
}