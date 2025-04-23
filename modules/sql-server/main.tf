resource "azurerm_mssql_server" "sqlserver" {
  name                          = "sql-${var.sql_server_name}"
  resource_group_name           = var.rg_name
  location                      = var.location
  administrator_login           = var.admin_username
  administrator_login_password  = var.admin_password
  version                       = "12.0"
  tags                          = var.az_tags
}

resource "azurerm_mssql_database" "sqldb" {
  name                        = "sqldb-${var.sql_db_name}"
  server_id                   = azurerm_mssql_server.sqlserver.id
  tags                        = var.az_tags
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name                    = var.sql_db_sku
  max_size_gb                 = 1
  storage_account_type        = "Local" # Geo, Local, Zne
  min_capacity                = length(regexall("GP_S_", var.sql_db_sku)) > 0 ? 1 : null
  auto_pause_delay_in_minutes = length(regexall("GP_S_", var.sql_db_sku)) > 0 ? 60 : null
  license_type                = length(regexall("GP_S_", var.sql_db_sku)) > 0 ? null : "LicenseIncluded"
}