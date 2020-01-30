#shell script for kubernetese installation
#docker included
#sina behmanesh 2020 - ubuntu 18.04
if [ $(id -u )-ne 0 ]
then
	echo "plese run as root"
	exit 1
else
	echo "itialtin installation...."
fi

sudo apt update

#docker  installation
sudo apt-get install docker.io

#K8s

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
