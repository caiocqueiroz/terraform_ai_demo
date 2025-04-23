resource "azurerm_resource_group" "my_resource_group" {
  name      = "rg-${var.rg_name}"
  location  = var.location
  tags      = var.az_tags
}