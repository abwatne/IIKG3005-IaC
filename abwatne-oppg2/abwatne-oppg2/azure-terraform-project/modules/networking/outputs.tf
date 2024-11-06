/*
output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
  description = "Public IP ID"
}

output "public_ip_name" {
  value = azurerm_public_ip.public_ip.name
  description = "Public IP name"
}

output "lb_id" {
  value = azurerm_lb.lb.id
  description = "ID of load balancer"
}
*/
output "snet_id" {
  value = azurerm_subnet.snet.id
  description = "Subnet ID"
}

/*output "snet_ase_id" {
  value = azurerm_subnet.snet_ase.id
  description = "Subnet ASE ID"
}*/

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
  description = "Virtual network ID"
}