import {
  id = var.rg_id
  to = azurerm_resource_group.rg
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "tfstate" {
  length = 5
  special = false
  upper = false
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "random_id" "log_analytics" {
  byte_length = 8
}