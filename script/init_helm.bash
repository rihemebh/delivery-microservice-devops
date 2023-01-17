#!/usr/bin/env bash  
set -e 

GATEWAY_PATH="$(readlink -f infrastructure)/k8s/gateway"
ORDER_PATH="$(readlink -f infrastructure)/k8s/order"
PRODUCT_PATH="$(readlink -f infrastructure)/k8s/product"


#kubectl apply -f ${GATEWAY_PATH}/secrets.yaml || echo "coudn't apply the secrets from gateway"
#kubectl apply -f ${GATEWAY_PATH}/config-map.yaml || echo "coudn't apply the config-map from gateway"
##kubectl apply -f ${ORDER_PATH}/00-namespace.yaml || echo "coudn't apply the namespace from order"
#kubectl apply -f ${ORDER_PATH}/secrets.yaml || echo "coudn't apply the secrets from order"
#kubectl apply -f ${ORDER_PATH}/networkpolicy.yaml || echo "coudn't apply the network policy from order"

#kubectl apply -f  ${PRODUCT_PATH}/00-namespace.yaml || echo "coudn't apply the namespace from product"
#kubectl apply -f  ${PRODUCT_PATH}/secrets.yaml ||echo "coudn't apply the secrets from product"
#kubectl apply -f  ${PRODUCT_PATH}/networkpolicy.yaml || echo "coudn't apply the network policy from product"

HELM_PATH="../infrastructure/helm"

helm install gateway-chart ${HELM_PATH}/gateway-chart || ( helm uninstall  gateway-chart && helm install gateway-chart ${HELM_PATH}/gateway-chart )
helm install order-chart ${HELM_PATH}/order-chart || ( helm uninstall  order-chart && helm install order-chart ${HELM_PATH}/order-chart )
helm install product-chart ${HELM_PATH}/product-chart || ( helm uninstall  product-chart && helm install product-chart ${HELM_PATH}/product-chart ) 

