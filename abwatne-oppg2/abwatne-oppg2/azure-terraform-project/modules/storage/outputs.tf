output "sa_primary_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
  description = "Storage account primary blob endpoint"
}

output "sa_primary_access_key" {
  value = azurerm_storage_account.sa.primary_access_key
  description = "Storage account primary access key"
}