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