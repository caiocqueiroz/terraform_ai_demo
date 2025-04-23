output "plan_id" {
  value = "${azurerm_service_plan.appserviceplan.id}"
}

output "plan_name" {
  value = "${azurerm_service_plan.appserviceplan.name}"
}