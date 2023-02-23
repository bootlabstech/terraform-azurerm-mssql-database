variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "mssql_name" {
  type        = string
  description = "name of the mssql server"
}

variable "database_name" {
  type        = string
  description = "name of the database_name "
}

variable "administrator_login" {
  type        = string
  description = "name of the administrator_login"
}

variable "administrator_login_password" {
  type        = string
  description = "name of the administrator_login_password"
}
