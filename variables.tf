variable "name" {
  type        = string
  description = "The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "server_id" {
  type        = string
  description = "The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created."
}

# variable "collation" {
#   type        = string
#   description = " Specifies the collation of the database. Changing this forces a new resource to be created."
# }

variable "license_type" {
  type        = string
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}

variable "max_size_gb" {
  type        = string
  description = "The max size of the database in gigabytes."
}

variable "read_scale" {
  type        = bool
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
  default = true
}

variable "sku_name" {
  type        = string
  description = "Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
}
variable "geo_backup_enabled" {
  type        = bool
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  default = true
}
variable "state" {
  type        = string
  description = "The State of the Policy. Possible values are Enabled, Disabled or New."
  default = "Enabled"
}