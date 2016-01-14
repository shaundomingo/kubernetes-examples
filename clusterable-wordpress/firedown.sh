#!/bin/bash

sampledir=$(pwd)

kubectl delete -f wordpress-controller.json
kubectl delete -f wordpress-service.json

cd ../../kubernetes
kubectl delete -f cluster/addons/kube-ui/kube-ui-rc.yaml --namespace=kube-system
kubectl delete -f cluster/addons/kube-ui/kube-ui-svc.yaml --namespace=kube-system
kubectl delete -f cluster/addons/cluster-monitoring/standalone/heapster-controller.yaml
kubectl delete -f cluster/addons/cluster-monitoring/standalone/heapster-service.yaml

cd ${sampledir}; cd ../../kubedash
kubectl delete -f deploy/kube-config.yaml --namespace=kube-system 

cd ${sampledir}

sleep 3

kubectl get rc,pods,services --all-namespaces -o wide
