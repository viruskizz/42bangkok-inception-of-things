#!/bin/bash
sudo apt-get update -y
sudo apt-get install sshpass -y
ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa <<<y
export K3S_TOKEN=$(sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.56.110 "sudo cat /var/lib/rancher/k3s/server/node-token")
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$K3S_TOKEN sh -