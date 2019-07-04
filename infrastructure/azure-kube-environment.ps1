# This script builds an ACR (Azure Container Registry) and a Kubernetes Cluster

# You'll need to set these variables.
$kubernetesResourceGroup="customer-app" # needs to be unique to your subscription
$acrName='customerappacr00' #must conform to the following pattern: '^[a-zA-Z0-9]*$
$aksClusterName='customer-app-cluster'
$location = 'eastus'
$idResourceGroupName = "customer-data" # the resource group where you're going to put your msi
$numberOfNodes = 1 # In production, you're going to want to use at least three nodes.

Write-Host "Creating resource group $kubernetesResourceGroup"
az group create -l $location -n $kubernetesResourceGroup

Write-Host "Creating the Azure Container Registry"
az acr create --resource-group $kubernetesResourceGroup --name $acrName --sku Standard --location $location

Write-Host "Creating a Service Principal for AKS"
$sp= az ad sp create-for-rbac --name "id-customer-app-aks" | ConvertFrom-Json

$acrID=az acr show --resource-group $kubernetesResourceGroup --name $acrName --query "id" --output tsv

Write-Host "Assigning the service principal to ACR pull"
az role assignment create --assignee $sp.appId --scope $acrID --role acrpull

Write-Host "This lets the cluster assign your managed service ID"
$idrg = az group show --name $idResourceGroupName | ConvertFrom-Json
az role assignment create --role "Managed Identity Operator" --assignee $sp.appId --scope $idrg.id

Write-Host "Building a Kubernetes Cluster"

az aks create `
    --resource-group $kubernetesResourceGroup `
    --name $aksClusterName `
    --node-count $numberOfNodes `
    --service-principal $sp.appId `
    --client-secret $sp.password `
    --generate-ssh-keys `
    --location $location

