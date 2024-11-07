resource "azurerm_network_security_group" "sg" {
  name                = "${var.base_name}-${var.sg_name}-${local.workspaces_suffix}-${var.random_string}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.base_name}-${var.vnet_name}-${local.workspaces_suffix}-${var.random_string}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "snet" {
  name                 = "${var.base_name}-${var.snet_name}-${local.workspaces_suffix}-${var.random_string}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action",]
      }
  }
}

resource "azurerm_subnet_network_security_group_association" "sg" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.sg.id
}