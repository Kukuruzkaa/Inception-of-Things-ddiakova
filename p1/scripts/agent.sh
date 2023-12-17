#!/bin/bash

export INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 -t $(sudo cat /vagrant/token) --node-ip=192.168.56.111"
curl -sfL https://get.k3s.io | sh -
systemctl status k3s-agent.service
sudo ip link add eth1 type dummy
sudo ip addr add 192.168.56.111/24 dev eth1
sudo ip link set eth1 up
sudo rm /vagrant/token