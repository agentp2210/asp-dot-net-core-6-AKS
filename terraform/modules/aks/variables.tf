variable "name" {
}

variable "location" {
}

variable "resource_group_name" {
}

variable "ssh_public_key" {
}

variable "kubernetes_version" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "dns_prefix" {
    default = "tamopsdns"
}

variable "kubernetes_cluster_rbac_enabled" {
  default = "true"
}

variable "aks_admins_group_object_id" {
  default = "e97b6454-3fa1-499e-8e5c-5d631e9ca4d1"
}


variable log_analytics_workspace_id {
}

variable aks_subnet_id {
}

variable agic_subnet_id {
}

variable "environment" {
}

variable "client_id" {
}

variable "client_secret" {
}