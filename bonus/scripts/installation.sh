#!/bin/bash


# update helm repo
helm repo add gitlab https://charts.gitlab.io/
helm repo update

kubectl create ns gitlab

DOMAIN_NAME="gitlab.inceptionofthings.com"

helm install gitlab gitlab/gitlab \
  --namespace gitlab \
  --set certmanager.install=false \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.tls.enabled=true \
  --set gitlab.webservice.ingress.tls.secretName=RELEASE-gitlab-tls \
  --set registry.ingress.tls.secretName=RELEASE-registry-tls \
  --set minio.ingress.tls.secretName=RELEASE-minio-tls \
  --set gitlab.kas.ingress.tls.secretName=RELEASE-kas-tls

helm upgrade --install gitlab gitlab/gitlab \
  --namespace gitlab \
  --timeout 600s \
  --set global.hosts.domain="$DOMAIN_NAME" \
  --set global.hosts.https=true \
  --set certmanager.install=false \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.tls.secretName=gitlab-tls \
  -f value.yaml