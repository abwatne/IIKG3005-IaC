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

/*variable "snet_ase_name" {
  type = string
  description = "Subnet ASE name"
  default = "snet_ase"
}

variable "public_ip_name" {
  type = string
  description = "Public IP name"
  default = "public"
}

variable "lb_name" {
  type = string
  description = "Load Balancer name"
  default = "lb"
}

variable "fe_ip_name" {
  type = string
  description = "Front end IP name"
  default = "feip"
}

variable "web_app_id" {
  type = string
  description = "Web app ID"
  default = ""
}*/

locals {
  allocation_method = "Static"

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
}
