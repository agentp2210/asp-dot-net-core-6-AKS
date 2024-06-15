#!/bin/bash
cd "$(dirname "$0")"

read -p "Service principal ID: " sp_id
read -p "Service principal secret: " sp_secret

rg_name=$(az group list --query "[].name" -o tsv)
rg_id=$(az group list --query "[].id" -o tsv)
location=$(az group list --query "[].location" -o tsv)
sa_name=tfstate$RANDOM
container_name="tfstate"

# Create backend for terraform
echo "Creating terraform remote backend"
az storage account create --name $sa_name --resource-group $rg_name
echo "Created storage account $(az storage account list --query "[].name" -o tsv)"

az storage container create --name $container_name --account-name $sa_name
echo "Created storage container $(az storage container list --account-name $sa_name --auth-mode login --query "[].name" -o tsv)"

# Init with remote backend
cd ../terraform
rm -r .terraform

terraform init \
    -backend-config="resource_group_name=$rg_name" \
    -backend-config="key=terraform.tfstate" \
    -backend-config="container_name=$container_name" \
    -backend-config="storage_account_name=$sa_name"

# Create the infra
terraform apply -var="client_id=$sp_id" -var="client_secret=$sp_secret" \
    -var="resource_group_name=$rg_name" -var="rg_id=$rg_id" -var="location=$location" \
    -var-file="./vars/dev.tfvars" --auto-approve

cluster_name=$(az aks list --query "[].name" -o tsv)
az aks get-credentials --name $cluster_name --resource-group $rg_name --overwrite-existing

kubectl get node