#!/bin/bash

export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san server --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
curl -sfL https://get.k3s.io | sh -
sudo systemctl status k3s
cat /etc/rancher/k3s/k3s.yaml
sudo cat /var/lib/rancher/k3s/server/node-token >> /vagrant/token
mkdir ~/.kube 
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up
