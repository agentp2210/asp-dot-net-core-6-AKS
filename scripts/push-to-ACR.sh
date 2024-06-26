#!/bin/bash
cd $(dirname "$0")

acr_url=$(az acr list --query "[].loginServer" -o tsv)
acr=$(az acr list --query "[].name" -o tsv)
az acr login --name $acr

# Remove image if exist
existing_image=$(docker images | grep azurecr | awk '{print $1}')
if [[ ! -z "$existing_image" ]]
then
    docker rmi $existing_image

docker build -t frontend ../code/frontend/ --no-cache
docker tag frontend:latest $acr_url/frontend/frontend:latest
docker push $acr_url/frontend/frontend:latest

docker build -t catalog ../code/catalog/ --no-cache
docker tag catalog:latest $acr_url/catalog/catalog:latest
docker push $acr_url/catalog/catalog:latest

docker build -t $acr_url/ordering/ordering:latest ../code/ordering/ --no-cache
docker tag ordering:latest $acr_url/catalog/ordering:latest
docker push $acr_url/ordering/ordering:latest