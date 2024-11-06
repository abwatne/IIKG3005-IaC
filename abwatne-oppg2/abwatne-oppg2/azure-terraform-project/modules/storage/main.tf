resource "azurerm_storage_account" "sa" {
  name                     = "${var.base_name}${local.sa_name}${var.random_string}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = local.account_tier
  account_replication_type = local.account_replication_type
}
# Dette er en liten change for å teste workflow nr. 2