#######################################
# GLOBAL VARIABLES
#######################################
variable "sigla" {
    description   = "Value for the name of project"
    type          = string
    default       = "exe08"
}

variable "ambiente" {
    description   = "Value for the name of environment"
    type          = string
    default       = "dev"
}

#######################################
# RESOURCE GROUP VARIABLES
#######################################
variable "location" {
    description   = "Azure Location to create Resources"
    type    = string
    default = "eastus"
}

#######################################
# WEBAPP VARIABLES
#######################################
variable "service_plan_sku" {
    description   = "Azure App Service Plan SKU"
    type          = string
    default       = "B1"
}