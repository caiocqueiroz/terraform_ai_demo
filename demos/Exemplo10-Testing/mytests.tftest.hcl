run "valid_rg_name" {
  command = plan
  assert {
    condition     = azurerm_resource_group.rg.name == "rg-exe10-dev"
    error_message = "Azure Resource Group name did not match expected"
  }
}

run "valid_rg_region" {
  command = plan
  assert {
    condition     = azurerm_resource_group.rg.location == "eastus"
    error_message = "Azure Resource Group Location did not match expected"
  }
}

run "valid_serviceplan_os_type" {
  command = plan
  assert {
    condition     = azurerm_service_plan.appserviceplan.os_type == "Linux"
    error_message = "Service Plan OS type did not match expected"
  }
}

run "valid_webapp_configs" {
  command = plan
  assert {
    condition     = azurerm_linux_web_app.webapp.https_only == true
    error_message = "WebApp HTTPS did not match expected"
  }

  assert {
    condition     = azurerm_linux_web_app.webapp.public_network_access_enabled == true
    error_message = "WebApp public network access did not match expected"
  }
}