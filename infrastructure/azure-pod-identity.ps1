$resourceGroup="customer-app"
$idname="id-customer-app"
$sqlServerName = "<todo>" # this needs to be all lower case

$identity= az identity create -g $resourceGroup -n $idname -o json | ConvertFrom-Json

Write-Host "Client Id: $identity.clientId"

# This is fine for a demo, but you want to grant fewer privlidges 
az sql server ad-admin create --resource-group $resourceGroup --server-name $sqlServerName --display-name customer-app-id --object-id $identity.principalId