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

variable "splan_name" {
  type = string
  description = "Service plan name"
  default = "splan"
}

variable "linux_web_app_name" {
  type = string
  description = "Linux web app name"
  default = "lwapp"
}

variable "snet_id" {
  type = string
  description = "Subnet ID"
  default = ""
}

locals {
  os_type = "Linux"
  sku_name = "B1"
  allocation_method = "Static"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}