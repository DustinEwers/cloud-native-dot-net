# To get the public id of your application
kubectl get service

# to see your pods
kubectl get pods

#interrogate a single pod
kubectl get -o json pod customer-app-7755684944-h47vt

# if you need to see the logs on your apps
kubectl logs -l app=customer-app
