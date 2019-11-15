
az aks get-credentials -g "$env:resource_group" -n "$env:aks_name" -a

kubectl create secret generic db-secret `
    --from-literal=SQLAZURECONNSTR_CustomerDb="$env:connection_string"