#!/bin/bash

export INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644 --bind-address=192.168.56.110 --advertise-address=192.168.56.110 --tls-san --node-ip 192.168.56.110"
curl -sfL https://get.k3s.io | sh -
sudo cat /var/lib/rancher/k3s/server/node-token >> /vagrant/token
systemctl status k3s
cat /etc/rancher/k3s/k3s.yaml
mkdir ~/.kube 
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config journalctl -xeu k3s
kubectl get nodes
