resource "azurerm_mssql_server" "mssqlserver" {
  name                         = "${var.base_name}-${var.mssql_name}-${local.workspaces_suffix}-${var.random_string}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

  public_network_access_enabled    = false
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "mssqldb" {
  name         = "${var.base_name}-${var.db_name}-${local.workspaces_suffix}-${var.random_string}"
  server_id    = azurerm_mssql_server.mssqlserver.id
  #collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = local.license_type
  max_size_gb  = local.max_size_gb
  sku_name     = local.sku_name
  enclave_type = local.enclave_type
  

  # prevent the possibility of accidental data loss
  lifecycle {
    #prevent_destroy = true #Commented out for learning purposes
  }
}