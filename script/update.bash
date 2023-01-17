#!/usr/bin/env bash  
set -e
helm uninstall  gateway-chart && helm install gateway-chart ../infrastructure/helm/gateway-chart 
 helm uninstall  order-chart && helm install order-chart ../infrastructure/helm/order-chart 
 helm uninstall  product-chart && helm install product-chart ../infrastructure/helm/product-chart 

