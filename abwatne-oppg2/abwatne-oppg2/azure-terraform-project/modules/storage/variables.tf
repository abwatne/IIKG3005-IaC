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

variable "sa_name" {
  type = string
  description = "Storage account name"
  default = "sa"
}

locals {
  account_tier = "Standard"
  account_replication_type = "GRS"
  min_tls_version = "TLS1_2"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
}