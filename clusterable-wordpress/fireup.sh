#!/bin/bash

sampledir=$(pwd)

kubectl create -f wordpress-controller.json
kubectl create -f wordpress-service.json

cd ../../kubernetes
kubectl create -f cluster/addons/kube-ui/kube-ui-rc.yaml --namespace=kube-system
kubectl create -f cluster/addons/kube-ui/kube-ui-svc.yaml --namespace=kube-system
kubectl create -f cluster/addons/cluster-monitoring/standalone/heapster-controller.yaml
kubectl create -f cluster/addons/cluster-monitoring/standalone/heapster-service.yaml

cd ${sampledir}; cd ../../kubedash
kubectl create -f deploy/kube-config.yaml --namespace=kube-system 

cd ${sampledir}

sleep 3

kubectl get rc,pods,services --all-namespaces -o wide
