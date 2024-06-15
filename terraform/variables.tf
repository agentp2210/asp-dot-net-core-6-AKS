variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_id" {
}


variable "client_id" {
}

variable "client_secret" {
}


variable "log_analytics_workspace_name" {
}


variable "vnet_name" {
}

variable "network_address_space" {
}

variable "aks_subnet_address_prefix" {
}

variable "aks_subnet_address_name" {
}

variable "appgw_subnet_address_prefix" {
}

variable "appgw_subnet_address_name" {
}


variable "aks_name" {
}

variable "vm_size" {
}

variable "agent_count" {
}

variable "kubernetes_version" {
}

variable "ssh_public_key" {
  default = "./sshkey/id_rsa.pub"
}



variable "acr_name" {
}

variable "aks_sp_app_id" {
  default = ""
}

variable "aks_sp_client_secret" {
  default = ""
}

variable "environment" {
}


variable "app_insights_name" {
  type = string
  description = "Application Insights Name"
}

variable "application_type" {
  type = string
  description = "Application Insights Type"
}