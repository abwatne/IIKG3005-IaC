#################################
###### Top level variables ######
#################################
variable "base_name" {
  type        = string
  description = "Resource groups base name"
  default     = ""
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
  default     = ""
}

variable "location" {
  type        = string
  description = "Location for the resource group"
  default     = ""
}

variable "random_string" {
  type        = string
  description = "Random string"
  default     = ""
}

#########################################
###### networking module variables ######
#########################################
variable "sg_name" {
  type        = string
  description = "Security group name"
  default     = "sg"
}

variable "vnet_name" {
  type        = string
  description = "Virtulal network name"
  default     = "vnet"
}

variable "snet_name" {
  type        = string
  description = "Subnet name"
  default     = "snet"
}

#######################################
###### database module variables ######
#######################################
variable "mssql_name" {
  type        = string
  description = "MSSQL server name"
  default     = "mssql"
}

variable "db_name" {
  type        = string
  description = "MSSQL databse name"
  default     = "db"
}

##########################################
###### app_service module variables ######
##########################################
variable "splan_name" {
  type        = string
  description = "Service plan name"
  default     = "splan"
}

variable "linux_web_app_name" {
  type        = string
  description = "Linux web app name"
  default     = "lwapp"
}

variable "vnet_id" {
  type        = string
  description = "Virtual network ID"
  default     = ""
}

######################################
###### storage module variables ######
######################################
variable "sa_name" {
  type        = string
  description = "Storage account name"
  default     = "sa"
}

#############################
###### local variables ######
#############################
locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.base_name}-${var.rg_name}-${local.workspaces_suffix}-${var.random_string}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}" : "${var.base_name}${var.sa_name}${local.workspaces_suffix}"
}