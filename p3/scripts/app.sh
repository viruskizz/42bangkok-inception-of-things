kubectl apply -f ./conf/wil42/application.yaml

kubectl port-forward -n dev service/wil-playground 8888:8888

# Stop forward port
ps aux | grep "kubectl port-forward"

# Get applicationss
kubectl get app -n argocd