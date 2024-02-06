sudo apt update -y
sudo apt install -y curl git
sudo curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
sudo k3d cluster create part3cluster -p "8081:80@loadbalancer" --agents 2
