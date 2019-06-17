# This script builds an ACR (Azure Container Registry) and a Kubernetes Cluster

# You'll need to set these variables.
$kubernetesResourceGroup="customer-app" # needs to be unique to your subscription
$acrName='<todo>' #must conform to the following pattern: '^[a-zA-Z0-9]*$
$aksClusterName='<todo>'
$location = 'eastus'
$numberOfNodes = 1 # In production, you're going to want to use at least three nodes.

Write-Host "Creating resource group $resourceGroupName"
az group create -l $location -n $kubernetesResourceGroup

Write-Host "Creating the Azure Container Registry"
az acr create --resource-group $kubernetesResourceGroup --name $acrName --sku Standard --location $location

Write-Host "Creating a Service Principal"
$sp= az ad sp create-for-rbac --skip-assignment | ConvertFrom-Json

$acrID=az acr show --resource-group $kubernetesResourceGroup --name $acrName --query "id" --output tsv

Write-Host "Assigning the service principal to ACR pull"
az role assignment create --assignee $sp.appId --scope $acrID --role acrpull

Write-Host "Building a Kubernetes Cluster"

az aks create `
    --resource-group $kubernetesResourceGroup `
    --name $aksClusterName `
    --node-count $numberOfNodes `
    --service-principal $sp.appId `
    --client-secret $sp.password `
    --generate-ssh-keys `
    --location $location
