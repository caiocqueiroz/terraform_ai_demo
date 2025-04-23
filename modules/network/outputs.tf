output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {
  description = "The ID of the first subnet"
  value       = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  description = "The ID of the second subnet"
  value       = azurerm_subnet.subnet2.id
}