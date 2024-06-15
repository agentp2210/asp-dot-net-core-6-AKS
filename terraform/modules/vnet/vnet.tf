resource "azurerm_virtual_network" "k8s" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = [var.network_address_space]

  tags = {
    Environment = var.environment
  }

}

resource "azurerm_subnet" "aks_subnet" {
  name = var.aks_subnet_address_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.k8s.name
  address_prefixes = [var.aks_subnet_address_prefix]
}

resource "azurerm_subnet" "appgw_subnet" {
  name = var.appgw_subnet_address_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.k8s.name
  address_prefixes = [var.appgw_subnet_address_prefix]
}