resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

resource "azurerm_resource_group" "rg-absw-web" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sa-absw-web" {
  name                     = "${var.sa_name}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg-absw-web.name
  location                 = azurerm_resource_group.rg-absw-web.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }
}

#Add an index html file to the storage account
resource "azurerm_storage_blob" "index-html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa-absw-web.name
  storage_container_name = "$web" #Spesiell funksjon, tilbyr static webpages
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
}

output "primary_web_webpoint" {
  value = azurerm_storage_account.sa-absw-web.primary_web_endpoint
}