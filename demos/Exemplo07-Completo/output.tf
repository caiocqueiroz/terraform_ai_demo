output "web_app_id" {
  value = module.app_service.web_app_id
}

output "web_app_name" {
  value = module.app_service.web_app_name
}

output "web_app_url" {
  value = module.app_service.web_app_url
}

output "acr_id" {
  value = module.acr.acr_id
}

output "aks_cluster_name" {
  value = module.aks.kubernetes_cluster_name
}