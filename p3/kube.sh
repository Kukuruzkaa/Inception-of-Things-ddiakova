
export KUBECONFIG=$(sudo k3d kubeconfig write part3cluster)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/grvelva/.bashrc
 eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install argocd
sudo kubectl create namespace argocd && sudo kubectl create namespace dev
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl apply -f argocd-manifest.yml -n argocd
sudo kubectl wait --for=condition=ready --timeout=1000s pod --all -n argocd
sudo chmod -R 777 /root
sudo kubectl apply -f service-ingress.yml
argocd admin initial-password -n argocd
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
sudo kubectl port-forward svc/argocd-server -nargocd 8080:443
