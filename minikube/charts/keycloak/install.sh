helm repo add bitnami https://charts.bitnami.com/bitnami
helm install keycloak -f charts/keycloak/keycloak-values.yaml bitnami/keycloak
kubectl apply -f charts/keycloak/keycloak-virtual-service.yaml
helm install redis -f charts/keycloak/redis-values.yaml bitnami/redis
kubectl apply -f charts/keycloak/oauth2-proxy.yaml
kubectl apply -f charts/keycloak/auth-filter.yaml

# kubectl delete envoyfilter.networking.istio.io/kowl-auth
# kubectl delete deployment/oauth2-proxy
# kubectl delete svc/oauthproxy-service
# kubectl delete networking.istio.io/keycloak-ingress