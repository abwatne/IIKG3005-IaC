#https://developer.hashicorp.com/terraform/language/backend/azurerm

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-absw-be"                # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "saabswbe"                  # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "backend.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }


}

provider "azurerm" {
  subscription_id = "8fe266af-9a8d-40b0-bcb6-08d23e112c60"
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
/*
resource "random_string" "random" {
  length           = 10
  special          = false
  upper = false
  numeric = false
}
*/

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg-absw-be" {
  name     = var.rg_backend_name
  location = var.location
}

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "sa-absw-be" {
  name                     = var.sa_backend_name
  resource_group_name      = azurerm_resource_group.rg-absw-be.name
  location                 = azurerm_resource_group.rg-absw-be.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "sc-absw-be" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa-absw-be.name
  container_access_type = "private"
}

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv-backend" {
  name                        = var.kv_backend_name
  location                    = azurerm_resource_group.rg-absw-be.location
  resource_group_name         = azurerm_resource_group.rg-absw-be.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Purge", "List", "Create"
    ]

    secret_permissions = [
      "Get", "Purge", "Set", "List"
    ]

    storage_permissions = [
      "Get", "Purge", "Set", "List"
    ]
  }
}


resource "azurerm_key_vault_secret" "sa-backend-accesskey" {
  name         = var.sa_backend_accesskey_name
  value        = azurerm_storage_account.sa-absw-be.primary_access_key
  key_vault_id = azurerm_key_vault.kv-backend.id
}