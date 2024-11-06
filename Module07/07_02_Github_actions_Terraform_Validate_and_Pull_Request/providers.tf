terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-absw-be"                 # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "saabswbe"                   # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "web-demo.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
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