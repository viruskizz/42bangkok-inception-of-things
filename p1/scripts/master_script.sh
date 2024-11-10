#!/bin/bash
sudo apt-get update -y
sudo mv /home/vagrant/sshd_config /etc/ssh/sshd_config
sudo systemctl restart sshd
curl -sfL https://get.k3s.io | sh -
sudo chmod 755 /etc/rancher/k3s/k3s.yaml