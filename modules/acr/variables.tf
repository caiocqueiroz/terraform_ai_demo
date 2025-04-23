variable "rg_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure Location to create Resources"
}

variable "az_tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
}

variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type        = string
  description = "Azure Container Registry SKU"
}