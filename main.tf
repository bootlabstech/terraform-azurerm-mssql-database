resource "azurerm_mssql_database" "database" {
  name           = var.name
  server_id      = var.server_id
  # collation      = var.collation
  license_type   = var.license_type
  max_size_gb    = var.max_size_gb
  sku_name       = var.sku_name
  read_scale     = var.read_scale
  geo_backup_enabled = var.geo_backup_enabled
  threat_detection_policy {
    state                      = var.state
  }

}
