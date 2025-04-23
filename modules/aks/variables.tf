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

variable "aks_name" {
  type = string
}

variable "aks_version" {
  type = string
}

variable "aks_node_pool_name" {
  type = string
}

variable "aks_node_pool_count" {
  type = number
}

variable "aks_node_pool_vm_size" {
  type = string
}

variable "aks_sku" {
  type    = string
  default = "Free"
  validation {
    condition     = contains(["Free", "Standard"], var.aks_sku)
    error_message = "The aks sku must be one of the following: Free, Standard"
  }
}

variable "acr_id" {
  type = string
}