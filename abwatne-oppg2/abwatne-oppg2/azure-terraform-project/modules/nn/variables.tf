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

variable "public_ip_id" {
  type = string
  description = "Public IP ID"
  default = ""
}

variable "public_ip_name" {
  type = string
  description = "Public IP name"
  default = ""
}

variable "fe_ip_name" {
  type = string
  description = "Front end IP name"
  default = "feip"
}

variable "lb_name" {
  type = string
  description = "Load Balancer name"
  default = "lb"
}

locals {
  allocation_method = "Static"
}