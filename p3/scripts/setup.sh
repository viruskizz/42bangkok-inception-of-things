#!/bin/bash
CLUSTER_NAME=inceptionofthings

k3d cluster create "$CLUSTER_NAME"

# List existing cluster
k3d cluster list

# Get Active nodes
kubectl get nodes

# Create a namespaces for ArgoCD and dev
kubectl create namespace argocd
kubectl create namespace dev

# Install ArgoCD to namespace argocd from github
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Check pod in argocd namespace
kubectl get pods -n argocd

# forward 8080 to 443 in argocd namepspace
kubectl port-forward -n argocd svc/argocd-server 8080:443
