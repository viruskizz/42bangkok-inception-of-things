#!/bin/bash
DOMAIN_NAME="gitlab.inceptionofthings.com"

sudo openssl genrsa -out ./confs/cert/server.key 2048

# Create certificate
sudo openssl req -new \
    -key ./confs/cert/server.key \
    -out  ./confs/cert/cert.csr \
    -subj '/CN=gitlab.inceptionofthings.com/C=TH/ST=Bangkok/L=Ladkrabang/O=42Bangkok/OU=Cadet/emailAddress=kizzaraiva@gmail.com'

# Create certificate
sudo openssl x509 \
    -in ./confs/cert/cert.csr \
    -out  ./confs/cert/server.crt \
    -req \
    -signkey ./confs/cert/server.key \
    -days 365

# Create private key
sudo openssl rsa -des3 \
    -in  ./confs/cert/server.key \
    -out ./confs/cert/privkey.pem

# Create fullchain
cat ./confs/cert/cert.csr ./confs/cert/server.crt > ./confs/cert/fullchain.pem

# Regenerate key if needed
sudo openssl rsa \
    -in ./confs/cert/privkey.pem \
    -out ./confs/cert/server.key

openssl req \
    -out localhost.crt \
    -keyout localhost.key \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -sha256 \
    -subj '/CN=gitlab.inceptionofthings.com/C=TH/ST=Bangkok/L=Ladkrabang/O=42Bangkok/OU=Cadet/emailAddress=kizzaraiva@gmail.com'

kubectl create secret tls gitlab-tls \
    --key ./confs/cert/localhost.key \
    --cert ./confs/cert/localhost.crt \
    -n gitlab
