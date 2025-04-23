variable "project_name" {
  type    = string
  default = "exe04"
}

variable "location" {
  type    = string
  default = "eastus"
  validation {
    condition     = contains(["eastus", "brazilsouth"], var.location)
    error_message = "The Location must be one of the following: eastus, brazilsouth"
  }
}

variable "environment" {
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "hml", "prd"], var.environment)
    error_message = "The environment variable must be one of 'dev', 'hml', or 'prd'."
  }
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    ambiente = "workshop"
    projeto  = "exe04"
  }
}