#!/bin/bash
sudo systemctl status k3s &> /dev/null
if [ $? -eq  4 ];
then
	sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
	sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
	sudo yum install net-tools -y
	curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --node-ip 192.168.56.110" sh -s -
	echo $PATH
	/usr/local/bin/kubectl apply -f=deployments.yaml -f=services.yaml -f=ingress.yaml
fi
