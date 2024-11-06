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