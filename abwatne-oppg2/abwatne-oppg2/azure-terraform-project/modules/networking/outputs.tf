output "snet_id" {
  value = azurerm_subnet.snet.id
  description = "Subnet ID"
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
  description = "Virtual network ID"
}