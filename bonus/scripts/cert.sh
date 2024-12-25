#!/bin/bash
DOMAIN_NAME="gitlab.inceptionofthings.com"
SECRET_NAME="gitlab-tls"
DIR="./confs/cert"
mkdir -p $DIR

# Create certifiate
openssl req \
    -out localhost.crt \
    -keyout localhost.key \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -sha256 \
    -subj '/CN='"$DOMAIN_NAME"'/C=TH/ST=Bangkok/L=Ladkrabang/O=42Bangkok/OU=Cadet/emailAddress=kizzaraiva@gmail.com'

# Add certificate to secret
kubectl create secret tls $SECRET_NAME \
    --key $DIR/localhost.key \
    --cert $DIR/localhost.crt \
    -n gitlab
