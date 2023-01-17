#!/usr/bin/env bash  
set -e 
kubectl  get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

 kubectl port-forward pod/argo-cd-argocd-server-5c9966c544-w2jld 8080:8080