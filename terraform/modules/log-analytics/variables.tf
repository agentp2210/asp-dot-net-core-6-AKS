variable log_analytics_workspace_name {
    default = "k8s-LAW"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
}

variable "resource_group_name" {
}

variable "location" {
}

variable "environment" {
}