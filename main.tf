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
resource "azurerm_key_vault_secret" "mysql_username" {
 name = "${var.mssql_name}-username"
 value = azurerm_mssql_server.mssql.administrator_login
 key_vault_id = data.azurerm_key_vault.key_vault.id

}


resource "azurerm_key_vault_secret" "mysql_password" {
 name  = "${var.mssql_name}-password"
 value = random_password.password.result
 key_vault_id = data.azurerm_key_vault.key_vault.id

}

data "azurerm_key_vault" "key_vault" {
 name  = var.keyvault_name
 resource_group_name = var.resource_group_name
}
resource "azurerm_mssql_firewall_rule" "example" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.mssql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}