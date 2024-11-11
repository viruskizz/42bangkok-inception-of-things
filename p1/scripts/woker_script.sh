#!/bin/bash
sudo systemctl status k3s-agent &> /dev/null
if [ $? -eq 4 ];
then
	sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
	sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
	sudo yum install net-tools expect -y
	curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=12345 sh -
	sudo sed -i  '/agent \\/d' /etc/systemd/system/k3s-agent.service
	sudo sed -i 's|ExecStart=/usr/local/bin/k3s \\|ExecStart=/usr/local/bin/k3s agent --node-ip=192.168.56.111|' /etc/systemd/system/k3s-agent.service
	sudo systemctl daemon-reload
	sudo systemctl restart k3s-agent
fi
