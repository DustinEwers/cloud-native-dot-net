$resourceGroupName = "customer-data"
$idname="id-customer-app"
$sqlServerName = "customer-db-server" # this needs to be all lower case

$identity= az identity create -g $resourceGroupName -n $idname -o json | ConvertFrom-Json

Write-Host "Client Id: $identity.clientId"

# This is fine for a demo, but you want to grant fewer privlidges in real life
az sql server ad-admin create --resource-group $resourceGroupName --server-name $sqlServerName --display-name customer-app-id --object-id $identity.principalId