# install k3s
curl -sfL https://get.k3s.io | sh -
# install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
