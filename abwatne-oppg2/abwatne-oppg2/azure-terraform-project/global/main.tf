resource "random_string" "random" {
  length = 3
  special = false
  upper = false
  numeric = false
}

output "random" {
  value = random_string.random.result
  description = "Random string result"
}

variable "base_name" {
  type = string
  description = "Base name"
  default = "absw"
}

output "base_name" {
  value = var.base_name
  description = "Base name output"
}

variable "location" {
  type = string
  description = "Resource group location"
  default = "westeurope"
}

output "location" {
  value = var.location
  description = "Location output"
}

variable "rg_name" {
  type = string
  description = "Resource group name"
  default = "rg"
}

output "rg_name" {
  value = var.rg_name
  description = "Resource group name output"
}

/*
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-absw-be"
    storage_account_name = "saabswbe"
    container_name       = "tfstate"
    key                  = "absw_oblig2.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "8fe266af-9a8d-40b0-bcb6-08d23e112c60"
  features {

  }
}
*/