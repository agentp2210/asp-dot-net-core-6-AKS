output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw_subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.k8s.id
}

output "vnet_name" {
  value = azurerm_virtual_network.k8s.name
}
