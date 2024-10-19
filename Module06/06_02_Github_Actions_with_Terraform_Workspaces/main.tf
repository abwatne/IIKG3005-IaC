# Random strings
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

# Local variables for suffixes
locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
  web_suffix        = "<h1>${terraform.workspace}</h1>"
}

# Create resource group
resource "azurerm_resource_group" "rg-absw-web" {
  name     = local.rg_name
  location = var.location
}

# Create storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "sa-absw-web" {
  name                     = "${lower(local.sa_name)}${random_string.random.result}"
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
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa-absw-web.primary_web_endpoint
}

#destory