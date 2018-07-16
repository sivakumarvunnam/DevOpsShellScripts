#!/bin/bash

#Install kubectl binary via curl
echo "Installing kubectl..........................."
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl

#Install KVM
curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04 > /usr/local/bin/docker-machine-driver-kvm && chmod +x /usr/local/bin/docker-machine-driver-kvm

#Instal minikube binary via curl
echo "Installing minikube.........................."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

#Start Minikube
echo "Starting Minikube..........................."
minikube start --vm-driver=kvm

kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod

sleep 30

kubectl get pod

curl $(minikube service hello-minikube --url)

minikube dashboard

sleep 60

minikube stop
