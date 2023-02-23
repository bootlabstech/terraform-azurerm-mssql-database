variable "group_name" {
  type        = string
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}

variable "storage_account_name" {
  type        = string
  description = "name of the storage account"
}

variable "file_storage_account_replication_type" {
  type        = string
  description = "replication type of file storage, LRS in uat and GRS in prod"
}

variable "container_set" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, access_type = string }))
}

variable "file_storage_list" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, quota = number }))
  default     = []
}

variable "queues_set" {
  description = "List of storages queues"
  type        = list(object({ name = string }))
  default     = []
}

variable "tables_set" {
  description = "List of storage tables."
  type        = list(object({ name = string }))
  default     = []
}
