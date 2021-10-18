# kubectl apply -f istio/gateway.yaml
helm install kafka charts/cp-kafka
helm install connect charts/cp-kafka-connect
helm install schema-registry charts/cp-schema-registry
helm install keycloak -f charts/keycloak/keycloak-values.yaml bitnami/keycloak
helm upgrade --install kowl charts/kowl
helm install redis -f charts/keycloak/redis-values.yaml bitnami/redis
# helm install postgres charts/postgresql

# helm delete keycloak
# helm delete kowl