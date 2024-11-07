output "sa_primary_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
  description = "Storage account primary blob endpoint"
}

output "sa_primary_access_key" {
  value = azurerm_storage_account.sa.primary_access_key
  description = "Storage account primary access key"
}

/*
output "storage_account_tier" {
  value = data.azurerm_storage_account.sa.access_tier
}
*/
/*
output "sa_name" {
  value = data.azurerm_storage_account.sa.name
}
*/