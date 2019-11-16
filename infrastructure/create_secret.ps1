
az aks get-credentials -g "$env:resource_group" -n "$env:aks_name" -a


$secret = kubectl get secrets db-secret --ignore-not-found=true

if($secret){
    kubectl delete secret db-secret
}

kubectl create secret generic db-secret `
    --from-literal=SQLAZURECONNSTR_CustomerDb="$env:connection_string"