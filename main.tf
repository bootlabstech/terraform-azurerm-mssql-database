resource "azurerm_mssql_server" "mssql" {
  # for_each= { for i in var.server_details : i.mssql_name => i }
  name                         = var.mssql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = random_password.password.result
}

resource "azurerm_mssql_database" "database" {
  for_each= { for i in var.db_details : i.database_name => i }
  name           = each.value.database_name
  server_id      = azurerm_mssql_server.mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant

  threat_detection_policy {
    state                      = "Enabled"
  }
}
resource "random_password" "password" {
 length = 16
 special = true
}