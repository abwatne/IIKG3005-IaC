variable "base_name" {
  type = string
  description = "Base name for resource groups"
  default = ""
}

variable "location" {
  type = string
  description = "Location for the resource group"
  default = ""
}

variable "rg_name" {
  type = string
  description = "Resource group name"
  default = ""
}

variable "random_string" {
  type = string
  description = "Random string"
  default = ""
}

variable "mssql_name" {
  type = string
  description = "MSSQL server name"
  default = "mssql"
}

variable "db_name" {
  type = string
  description = "MSSQL databse name"
  default = "db"
}

variable "sa_endpoint" {
  type = string
  description = "Storage account primary blob endpoint"
  default = ""
}

variable "sa_primary_access_key" {
  type = string
  description = "Storage account primary access key"
  default = ""
}

locals {
  sku_name = "S0"
  enclave_type = "VBS"
  max_size_gb = 2
  license_type = "LicenseIncluded"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}