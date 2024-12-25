#!/bin/bash
# update helm repo
helm repo add gitlab https://charts.gitlab.io/
helm repo update

kubectl create ns gitlab

DOMAIN_NAME="gitlab.inceptionofthings.com"
SECRET_NAME="gitlab-tls"

helm upgrade --install gitlab gitlab/gitlab \
  --namespace gitlab \
  --timeout 600s \
  --set global.hosts.domain="$DOMAIN_NAME" \
  --set global.hosts.https=true \
  --set certmanager.install=false \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.tls.secretName=$SECRET_NAME \
  -f value.yaml