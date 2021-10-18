#curl -L https://istio.io/downloadIstio | sh -
export PATH=/Users/gokhanimral/Projects/kafka-ui/minikube/istio-1.11.3/bin:$PATH
istioctl install
kubectl label namespace default istio-injection=enabled

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(minikube ip)
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"


kubectl get pods -n istio-system -l app=istio-ingressgateway
kubectl exec \
    istio-ingressgateway-57449dd8bc-tw6hf \
    -c istio-proxy -- curl -X POST \
    http://localhost:15000/logging\?level\=debug


sudo vi /etc/hosts
sudo killall -HUP mDNSResponder     


istioctl proxy-config listener kowl-67fddb5884-twl4b.default
