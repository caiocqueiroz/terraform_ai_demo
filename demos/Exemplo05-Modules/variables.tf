#######################################
# GLOBAL VARIABLES
#######################################
variable "sigla" {
  description = "Value for the name of project"
  type        = string
  default     = "exe05"
}

variable "ambiente" {
  description = "Value for the name of environment"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "hml", "prd"], var.ambiente)
    error_message = "The environment variable must be one of 'dev', 'hml', or 'prd'."
  }
}

#######################################
# RESOURCE GROUP VARIABLES
#######################################
variable "location" {
  description = "Azure Location to create Resources"
  type        = string
  default     = "eastus"
  validation {
    condition     = contains(["eastus", "brazilsouth"], var.location)
    error_message = "The Location must be one of the following: eastus, brazilsouth"
  }
}

#######################################
# WEBAPP VARIABLES
#######################################
variable "service_plan_sku" {
  description = "Azure App Service Plan SKU"
  type        = string
  default     = "B1"
}