#!/bin/bash

export INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token-file $(sudo cat /vagrant/token) --node-ip=192.168.56.111"
curl -sfL https://get.k3s.io | sh -
kubectl get nodes