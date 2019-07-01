$sqlAdminUserName = 'customerAdmin'
$sqlAdminPassword = '!Q@W#E$Rqweerty'
$sqlServerName = "customerdbserver" # this needs to be all lower case
$resourceGroupName = "customer-data" #this needs to be unique to your subscription
$sqlDatabaseName = 'customer-db'
$location = 'eastus'

Server=tcp:customerdbserver.database.windows.net,1433;Initial Catalog=customer-db;Persist Security Info=False;User ID=customerAdmin;Password=!Q@W#E$Rqweerty;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;

kubectl apply -f \infrastructure\customer-app-deployment.yaml -o json
kubectl apply -f \infrastructure\customer-app-aad.yaml -o json


$kubernetesResourceGroup="customer-app"
$acrName='customerappacr00' #must conform to the following pattern: '^[a-zA-Z0-9]*$
$aksClusterName='customer-app-cluster'
$location = 'eastus'
$numberOfNodes = 1 # In production, you're going to want to use at least three nodes.


[command]/usr/bin/docker push customerappacr00.azurecr.io/dustinewers/cloud-native-dot-net:11
The push refers to repository [customerappacr00.azurecr.io/dustinewers/cloud-native-dot-net]

Client Id: @{clientId=70c39bc8-7e89-432e-b99c-a94e1991bba7; clientSecretUrl=https://control-eastus.identity.azure.net/subscriptions/8326d01c-4f7e-47d6-b58f-8d4596245ec1/resourcegroups/customer-app/providers/Microsoft.ManagedIdentity/userAssignedIdentities/id-customer-app/credentials?tid=120ff116-711c-4978-9bb7-2d41205ed281&oid=4194ffd3-57b9-466d-a585-b25a161e0149&aid=70c39bc8-7e89-432e-b99c-a94e1991bba7; id=/subscriptions/8326d01c-4f7e-47d6-b58f-8d4596245ec1/resourcegroups/customer-app/providers/Microsoft.ManagedIdentity/userAssignedIdentities/id-customer-app; location=eastus; name=id-customer-app; principalId=4194ffd3-57b9-466d-a585-b25a161e0149; resourceGroup=customer-app; tags=; tenantId=120ff116-711c-4978-9bb7-2d41205ed281; type=Microsoft.ManagedIdentity/userAssignedIdentities}.clientId