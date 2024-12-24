kubectl apply -f ./conf/application.yaml

kubectl port-forward -n dev service/wil-playground 8888:8888

# Stop forward port
ps aux | grep "kubectl port-forward"

# Get applicationss
kubectl get app -n argocd

# To remove app
kubectl patch app wil42  -p '{"metadata": {"finalizers": null}}' --type merge
kubectl delete app wil42
