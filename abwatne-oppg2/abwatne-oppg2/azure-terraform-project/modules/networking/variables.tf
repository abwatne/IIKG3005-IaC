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

variable "sg_name" {
  type = string
  description = "Security group name"
  default = "sg"
}

variable "vnet_name" {
  type = string
  description = "Virtulal network name"
  default = "vnet"
}

variable "snet_name" {
  type = string
  description = "Subnet name"
  default = "snet"
}

locals {
  allocation_method = "Static"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  #rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.base_name}-${var.rg_name}-${local.workspaces_suffix}"
}