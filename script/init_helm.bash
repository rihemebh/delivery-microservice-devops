#!/usr/bin/env bash  
set -e 

GATEWAY_PATH="../infrastructure/k8s/gateway"
ORDER_PATH="../infrastructure/k8s/order"
PRODUCT_PATH="../infrastructure/k8s/product"


kubectl apply -f ${GATEWAY_PATH}/secrets.yaml || echo "coudn't apply the secrets from gateway"
kubectl apply -f ${GATEWAY_PATH}/config-map.yaml || echo "coudn't apply the config-map from gateway"
kubectl apply -f ${ORDER_PATH}/00-namespace.yaml || echo "coudn't apply the namespace from order"
kubectl apply -f ${ORDER_PATH}/secrets.yaml || echo "coudn't apply the secrets from order"
kubectl apply -f ${ORDER_PATH}/networkpolicy.yaml || echo "coudn't apply the network policy from order"

kubectl apply -f  ${PRODUCT_PATH}/00-namespace.yaml || echo "coudn't apply the namespace from product"
kubectl apply -f  ${PRODUCT_PATH}/secrets.yaml ||echo "coudn't apply the secrets from product"
kubectl apply -f  ${PRODUCT_PATH}/networkpolicy.yaml || echo "coudn't apply the network policy from product"


helm install gateway-chart ../infrastructure/helm/gateway-chart || ( helm uninstall  gateway-chart && helm install gateway-chart ../infrastructure/helm/gateway-chart )
helm install order-chart ../infrastructure/helm/order-chart || ( helm uninstall  order-chart && helm install order-chart ../infrastructure/helm/order-chart )
helm install product-chart ../infrastructure/helm/product-chart || ( helm uninstall  product-chart && helm install product-chart ../infrastructure/helm/product-chart ) 
