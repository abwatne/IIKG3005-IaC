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


########################
/*variable "static_name" {
  type = string
  description = "Static web app name"
  default = "stapp"
}

variable "fe_ip_name" {
  type = string
  description = "Front end IP name"
  default = "feip"
}

variable "lb_id" {
  type = string
  description = "Load Balancer ID"
  default = ""
}

variable "public_ip_name" {
  type = string
  description = "Public IP name"
  default = "pip"
}

variable "lb_name" {
  type = string
  description = "Load Balancer name"
  default = "lb"
}*/

variable "snet_id" {
  type = string
  description = "Subnet ID"
  default = ""
}
/*
variable "snet_ase_id" {
  type = string
  description = "Subnet ASE ID"
  default = ""
}

variable "nic_name" {
  type = string
  description = "NIC name"
  default = "nic"
}

variable "ipconf_name" {
  type = string
  description = "IP configuration name"
  default = "ipconf"
}*/
/*
variable "vnet_id" {
  type = string
  description = "Virtual network ID"
  default = ""
}
*/
locals {
  os_type = "Linux"
  sku_name = "B1"
  allocation_method = "Static"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
}