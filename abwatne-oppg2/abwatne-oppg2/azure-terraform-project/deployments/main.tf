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

resource "azurerm_resource_group" "absw_oblig2" {
  name     = local.rg_name
  location = "West Europe"
}

module "global" {
  source = "../global"
}

module "app_service" {
  source             = "../modules/app_service"
  rg_name            = azurerm_resource_group.absw_oblig2.name
  location           = azurerm_resource_group.absw_oblig2.location
  splan_name         = var.splan_name
  linux_web_app_name = var.linux_web_app_name
  snet_id            = module.networking.snet_id
  random_string = module.global.random
  #snet_ase_id = module.networking.snet_ase_id
  #lb_name            = var.lb_name
  #nic_name = var.nic_name
  #vnet_id = module.networking.vnet_id
  #public_ip_name     = var.public_ip_name
}

module "database" {
  source     = "../modules/database"
  rg_name    = azurerm_resource_group.absw_oblig2.name
  mssql_name = var.mssql_name
  db_name    = var.db_name
  random_string = module.global.random
  sa_endpoint = module.storage.sa_primary_endpoint
  sa_primary_access_key = module.storage.sa_primary_access_key
}

module "networking" {
  source    = "../modules/networking"
  rg_name   = azurerm_resource_group.absw_oblig2.name
  sg_name   = var.sg_name
  vnet_name = var.vnet_name
  snet_name = var.snet_name
random_string = module.global.random

  #web_app_id     = module.app_service.web_app_id
}

module "storage" {
  source  = "../modules/storage"
  rg_name = azurerm_resource_group.absw_oblig2.name
  sa_name = var.sa_name
  random_string = module.global.random
}