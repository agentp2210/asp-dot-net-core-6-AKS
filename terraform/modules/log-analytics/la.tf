resource "azurerm_log_analytics_workspace" "k8s" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = var.log_analytics_workspace_name
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = var.log_analytics_workspace_sku
      tags = {
    Environment = var.environment
  }
}

resource "azurerm_log_analytics_solution" "k8s" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.k8s.location
    resource_group_name   = var.resource_group_name
    workspace_resource_id = azurerm_log_analytics_workspace.k8s.id
    workspace_name        = azurerm_log_analytics_workspace.k8s.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}