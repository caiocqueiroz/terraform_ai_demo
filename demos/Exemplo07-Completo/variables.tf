#######################################
# GLOBAL VARIABLES
#######################################
variable "sigla" {
  description = "Value for the name of project"
  type        = string
  default     = "exe07"
}

variable "ambiente" {
  description = "Value for the name of environment"
  type        = string
  default     = "dev"
}

#######################################
# RESOURCE GROUP VARIABLES
#######################################
variable "location" {
  description = "Azure Location to create Resources"
  type        = string
  default     = "eastus2"
}

#######################################
# WEBAPP VARIABLES
#######################################
variable "service_plan_sku" {
  description = "Azure App Service Plan SKU"
  type        = string
  default     = "B1"
}

#######################################
# ACR VARIABLES
#######################################
variable "acr_sku" {
  description = "Azure ACR SKU"
  type        = string
  default     = "Basic"
}

#######################################
# AKS VARIABLES
#######################################
variable "aks_version" {
  type    = string
  default = "1.29.2"
}

variable "aks_node_pool_name" {
  type    = string
  default = "pooldefault"
}

variable "aks_node_pool_count" {
  type    = number
  default = 2
}

variable "aks_node_pool_vm_size" {
  type    = string
  default = "Standard_D2_v2"
}

variable "aks_sku" {
  type    = string
  default = "Free"
  validation {
    condition     = contains(["Free", "Standard"], var.aks_sku)
    error_message = "The aks sku must be one of the following: Free, Standard"
  }
}
