#!/bin/bash
# Purpose: docker installation + kubectl + kind

# Docker Installation
apt update -y && apt install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh
systemctl start docker
systemctl enable docker

# Kubectl Installation
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# Kind Installation
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin

# End

#########################################################################
# https://hub.docker.com/u/kindest
# https://hub.docker.com/r/kindest/node/tags

# kind create cluster --name cloudgeeks-ca

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.18.6

# kubectl cluster-info --context kind-cloudgeeks-ca

# kind delete cluster --name kind-cloudgeeks-ca

# Delete a cluster ---> docker rm -f $(docker ps -aq)

# Cluster stuck   ----> systemctl restart docker


##########################################################################