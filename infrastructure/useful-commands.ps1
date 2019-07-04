# To get the public ip of your application
kubectl get service

# to see your pods
kubectl get pods

#interrogate a single pod
kubectl get -o json pod customer-app-7755684944-h47vt

# if you need to see the logs on your apps
kubectl logs -l app=customer-app

# if you want to see the log of a specific pod
kubectl logs mic-774f7ccc4-dhttp --tail 50

# get information on the MSI pod binding
kubectl describe azureidentity
kubectl describe azureidentitybinding