locals {
  tags = {
    Ambiente   = "${var.ambiente}"
    Solução    = "${var.sigla}"
    Provimento = "Terraform"
  }
}

module "rg" {
  source   = "../../modules/resource-group"
  rg_name  = "${var.sigla}-${var.ambiente}"
  location = var.location
  az_tags  = local.tags
}

module "app_plan" {
  source            = "../../modules/service-plan"
  rg_name           = module.rg.name
  location          = module.rg.location
  az_tags           = local.tags
  service_plan_name = "${var.sigla}-${var.ambiente}"
  service_plan_sku  = var.service_plan_sku
}

module "app_service" {
  source      = "../../modules/app-service"
  rg_name     = module.rg.name
  location    = module.rg.location
  az_tags     = local.tags
  webapp_name = "${var.sigla}-${var.ambiente}"
  plan_id     = module.app_plan.plan_id
}

module "acr" {
  source   = "../../modules/acr"
  rg_name  = module.rg.name
  location = module.rg.location
  az_tags  = local.tags
  acr_name = "${var.sigla}${var.ambiente}"
  acr_sku  = var.acr_sku
}

module "aks" {
  source                = "../../modules/aks"
  rg_name               = module.rg.name
  location              = module.rg.location
  az_tags               = local.tags
  aks_name              = "${var.sigla}-${var.ambiente}"
  aks_version           = var.aks_version
  aks_sku               = var.aks_sku
  aks_node_pool_name    = var.aks_node_pool_name
  aks_node_pool_count   = var.aks_node_pool_count
  aks_node_pool_vm_size = var.aks_node_pool_vm_size
  acr_id                = module.acr.acr_id
}
