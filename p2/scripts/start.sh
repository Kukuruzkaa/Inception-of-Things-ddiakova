whoami
curl -sfL https://get.k3s.io | sh -s - \
--write-kubeconfig-mode 644 --tls-san \
server --node-ip 192.168.56.110 --bind-address=192.168.56.110 \
--advertise-address=192.168.56.110
mkdir -p .kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
whoami
export PATH="$PATH:/usr/local/bin"
kubectl apply -f /tmp/scripts/deployment-app-one.yaml 
kubectl apply -f /tmp/scripts/deployment-app-two.yaml 
kubectl apply -f /tmp/scripts/deployment-app-three.yaml 
kubectl apply -f /tmp/scripts/service.yaml 
kubectl apply -f /tmp/scripts/ingress.yaml 