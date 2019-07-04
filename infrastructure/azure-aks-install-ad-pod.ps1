# this assumes you have kubectl installed and have logged into your cluster if not, here are the commands:
# az aks install-cli 
# az aks get-credentials --resource-group customer-app --name customer-app-cluster

#this installs the aad pod identity stuff you'll need to use to add aad pod identity objects to your cluster
# ref: https://github.com/Azure/aad-pod-identity
kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment-rbac.yaml

# test your work with the following commands
kubectl api-versions

# you should see "aadpodidentity.k8s.io/v1" in the list