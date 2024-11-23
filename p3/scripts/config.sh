kubectl create namespace argocd
kubectl get pods -n argocd
kubectl port-forward -n argocd svc/argocd-server 8080:443

# Get ArgoCD admin password
ARGOCD_USER="admin"
ARGOCD_PASS="$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 --decode)"