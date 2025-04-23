resource "azurerm_service_plan" "appserviceplan" {
  name                = "asp-${var.service_plan_name}"
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = var.service_plan_sku
  tags                = var.az_tags
}