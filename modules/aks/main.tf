resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.aks_name}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "aks-${var.aks_name}"
  kubernetes_version  = var.aks_version
  sku_tier            = var.aks_sku
  node_resource_group = "rg-aks-${var.aks_name}"
  tags                = var.az_tags
  default_node_pool {
    name           = var.aks_node_pool_name
    node_count     = var.aks_node_pool_count
    vm_size        = var.aks_node_pool_vm_size
  }
  identity {
    type = "SystemAssigned"
  }

  # Configuração de monitoração - Log Analytics add-on profile for the Kubernetes Cluster
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  }
}

#resource "azurerm_role_assignment" "acr_aks" {
#  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#  role_definition_name             = "AcrPull"
#  scope                            = var.acr_id
#  skip_service_principal_aad_check = true
#}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "log-${var.aks_name}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  tags                = var.az_tags
}

resource "azurerm_log_analytics_solution" "aks_logs" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_name        = azurerm_log_analytics_workspace.law.name
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  tags                  = var.az_tags
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}