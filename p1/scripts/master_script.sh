#!/bin/bash
sudo systemctl status k3s &> /dev/null
if [ $? -eq 4 ];
then
	sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
	sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
	sudo yum install net-tools -y
	curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true K3S_TOKEN=12345 sh -
	sudo sed -i  '/server \\/d' /etc/systemd/system/k3s.service
	sudo sed -i 's|ExecStart=/usr/local/bin/k3s \\|ExecStart=/usr/local/bin/k3s server --node-ip=192.168.56.110|' /etc/systemd/system/k3s.service
	sudo systemctl daemon-reload
	sudo systemctl restart k3s
	sudo chmod 755 /etc/rancher/k3s/k3s.yaml
fi