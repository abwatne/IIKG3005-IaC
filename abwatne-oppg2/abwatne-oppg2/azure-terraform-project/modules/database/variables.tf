variable "base_name" {
  type = string
  description = "Base name for resource groups"
  default = "absw"
}

variable "location" {
  type = string
  description = "Location for the resource group"
  default = "westeurope"
}

variable "rg_name" {
  type = string
  description = "Resource group name"
  default = "rg"
}

variable "random_string" {
  type = string
  description = "Random string"
  default = ""
}

variable "mssql_name" {
  type = string
  description = "MSSQL server name"
  default = "abswmssql123"
}

variable "db_name" {
  type = string
  description = "MSSQL databse name"
  default = "db"
}

locals {
  sku_name = "S0"
  enclave_type = "VBS"
  max_size_gb = 2
  license_type = "LicenseIncluded"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}