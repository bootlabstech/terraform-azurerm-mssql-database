resource "azurerm_mssql_server" "mssql" {
  name                         = var.mssql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "database" {
  name           = var.database_name
  server_id      = azurerm_mssql_server.mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.max_size_gb
  read_scale     = var.resource
  sku_name       = var.sku_name
  zone_redundant = var.zone_redundant

  threat_detection_policy {
    state                      = "Enabled"
  }
}
