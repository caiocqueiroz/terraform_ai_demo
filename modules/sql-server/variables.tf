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

variable "sql_server_name" {
  type        = string
  description = "SQL Server Name"
}

variable "sql_db_sku" {
  type        = string
  description = "SQL Server SKU"
}

variable "sql_db_name" {
  type        = string
  description = "SQL Database Name"
}

variable "admin_username" {
  type        = string
  description = "SQL Server Admin Username"
}

variable "admin_password" {
  type        = string
  description = "SQL Server Admin Password"
}