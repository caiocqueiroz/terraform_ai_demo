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

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = string
}

variable "subnet1_name" {
  description = "The name of the first subnet"
  type        = string
}

variable "subnet1_address_prefix" {
  description = "The address prefix of the first subnet"
  type        = string
}

variable "subnet2_name" {
  description = "The name of the second subnet"
  type        = string
}

variable "subnet2_address_prefix" {
  description = "The address prefix of the second subnet"
  type        = string
}
