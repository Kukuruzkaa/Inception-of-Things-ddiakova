whoami
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
mkdir -p .kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
whoami
export NAMESPACE=grvelva
echo $PATH
export PATH="$PATH:/usr/local/bin"
echo $PATH
kubectl apply -f /tmp/scripts/deployment.yaml
kubectl apply -f /tmp/scripts/service.yaml
kubectl apply -f /tmp/scripts/ingress.yaml