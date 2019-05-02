# This script creates a SQL Database

# You'll need to adjust these variables accordingly

$sqlAdminUserName = '<todo>'
$sqlAdminPassword = '<todo>'
$sqlServerName = "<todo>" # this needs to be all lower case
$resourceGroupName = "customer-data" #this needs to be unique to your subscription
$sqlDatabaseName = 'customer-db'
$location = 'eastus'

Write-Host "Creating resource group $resourceGroupName"
az group create --name $resourceGroupName --location $location

Write-Host "Creating SQL Server $sqlServerName"
az sql server create `
    --name $sqlServerName `
    --resource-group $resourceGroupName `
    --location $location  `
    --admin-user $sqlAdminUserName `
    --admin-password $sqlAdminPassword

Write-Host "Creating database $sqlDatabaseName"
az sql db create `
	--resource-group $resourceGroupName `
	--server $sqlServerName `
	--name $sqlDatabaseName `
	--service-objective S0

Write-Host "Creating firewall rule..."
az sql server firewall-rule create -g $resourceGroupName -s $sqlServerName -n "allowAzure" --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
