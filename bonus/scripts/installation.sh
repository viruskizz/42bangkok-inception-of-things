#!/bin/bash


# update helm repo
helm repo add gitlab https://charts.gitlab.io/
helm repo update

kubectl create ns gitlab


DOMAIN_NAME="http://gitlab.inceptionofthing.com"

helm install gitlab gitlab/gitlab \
  --set certmanager.install=false \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.tls.enabled=true \
  --set gitlab.webservice.ingress.tls.secretName=RELEASE-gitlab-tls \
  --set registry.ingress.tls.secretName=RELEASE-registry-tls \
  --set minio.ingress.tls.secretName=RELEASE-minio-tls \
  --set gitlab.kas.ingress.tls.secretName=RELEASE-kas-tls