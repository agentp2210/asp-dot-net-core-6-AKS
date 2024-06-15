resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name                 = "agentpool"
    node_count           = var.agent_count
    vm_size              = var.vm_size
    vnet_subnet_id       = var.aks_subnet_id
    # type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
  }

  service_principal {
    client_id = var.client_id
    client_secret = var.client_secret
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  ingress_application_gateway {
    subnet_id = var.agic_subnet_id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = var.environment
  }
}

