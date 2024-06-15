#log Analytics
log_analytics_workspace_name = "k8s-LAW"

# Virtual Network
vnet_name                   = "AksVnet"
network_address_space       = "192.168.0.0/16"
aks_subnet_address_prefix   = "192.168.0.0/24"
aks_subnet_address_name     = "aks"
appgw_subnet_address_prefix = "192.168.1.0/24"
appgw_subnet_address_name   = "appgw"

# AKS
aks_name           = "myAKSCluster"
kubernetes_version = "1.29"
agent_count        = 3
vm_size            = "Standard_D2s_v3"
ssh_public_key     = "./sshkey/id_rsa.pub"

# ACR
acr_name = "myAKSClusterACR"

environment = "dev"

# App Insights
app_insights_name = "devopsjourney"
application_type  = "web"