

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

# variable "server_details" {
#   type        = list(any)
#   description = "name of the mssql server"
# }

variable "db_details" {
  type        = list(any)
  description = "name of the database_name "
}

variable "administrator_login" {
  type        = string
  description = "name of the administrator_login"
}

variable "keyvault_name" {
  type        = string
  description = "name of the administrator_login_password"
}

variable "mssql_name" {
  type        = string
  description = "read_scale"
}
# variable "max_size_gb" {
#   type        = number
#   description = "max_size_gb"
# }
# variable "sku_name" {
#   type        = string
#   description = "sku_name"
# }
# variable "zone_redundant" {
#   type        = bool
#   description =  "zone_redundant"
# }

