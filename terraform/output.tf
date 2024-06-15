output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

# This is only required when using "managed identity"
# output "kubelet_object_id" {
#   value = module.aks.kubelet_object_id
# }

output "client_key" {
  value     = module.aks.client_key
  sensitive = true
}

output "client_certificate" {
  value     = module.aks.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.aks.cluster_ca_certificate
  sensitive = true
}

output "cluster_username" {
  value     = module.aks.cluster_username
  sensitive = true
}

output "cluster_password" {
  value     = module.aks.cluster_password
  sensitive = true
}

output "host" {
  value     = module.aks.host
  sensitive = true
}

output "node_resource_group" {
  value     = module.aks.node_resource_group
}

output "node_resource_group_id" {
  value     = module.aks.node_resource_group_id
}


output "instrumentation_key" {
  value = module.appinsights.instrumentation_key
  sensitive = true
}