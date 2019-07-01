
$resourceGroupName = "customer-data" #this needs to be unique to your subscription
$keyVaultName = 'customer-app-keyvault'
$idObjectId="4194ffd3-57b9-466d-a585-b25a161e0149"
$location = 'eastus'

az keyvault create --name $keyVaultName --resource-group $resourceGroupName --location $location

az keyvault set-policy --name $keyVaultName --object-id $idObjectId --secret-permissions get list