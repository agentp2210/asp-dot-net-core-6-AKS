module "loganalytics" {
  source                       = "./modules/log-analytics"
  log_analytics_workspace_name = "${var.log_analytics_workspace_name}-${random_id.log_analytics.dec}"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  log_analytics_workspace_sku  = "PerGB2018"
  environment = var.environment
}

module "vnet_aks" {
  source                      = "./modules/vnet"
  name                        = var.vnet_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  network_address_space       = var.network_address_space
  aks_subnet_address_prefix   = var.aks_subnet_address_prefix
  aks_subnet_address_name     = var.aks_subnet_address_name
  appgw_subnet_address_prefix = var.appgw_subnet_address_prefix
  appgw_subnet_address_name   = var.appgw_subnet_address_name
  environment = var.environment
}

module "aks" {
  source                     = "./modules/aks"
  name                       = var.aks_name
  resource_group_name        = var.resource_group_name
  kubernetes_version         = var.kubernetes_version
  agent_count                = var.agent_count
  vm_size                    = var.vm_size
  location                   = var.location
  ssh_public_key             = file(var.ssh_public_key)
  log_analytics_workspace_id = module.loganalytics.id
  aks_subnet_id              = module.vnet_aks.aks_subnet_id
  agic_subnet_id             = module.vnet_aks.appgw_subnet_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  environment                = var.environment
}

module "acr" {
  source   = "./modules/acr"
  name     = "${var.acr_name}${random_integer.ri.result}"
  location = var.location
  resource_group_name = var.resource_group_name
  environment = var.environment
}

module "appinsights" {
  source           = "./modules/appinsights"
  name             = var.app_insights_name
  resource_group_name        = var.resource_group_name
  location         = var.location
  environment      = var.environment
  application_type = var.application_type
}