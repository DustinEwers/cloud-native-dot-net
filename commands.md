# Misc Commands

$kubernetesResourceGroup="customer-app"
$aksClusterName="customer-app-cluster"

az aks get-credentials --resource-group $kubernetesResourceGroup --name $aksClusterName

kubectl apply -f .\infrastructure\customer-app-deployment.yaml -o json

kubectl get service customer-app

customer-app.eastus.cloudapp.azure.com

kubectl logs -l app=customer-app