whoami
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
mkdir -p .kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
