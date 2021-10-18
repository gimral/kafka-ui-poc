CLUSTER_IP=$(minikube ip)
sudo mkdir -p /etc/resolver
echo "nameserver $CLUSTER_IP" | sudo tee /etc/resolver/minikube.local
echo "domain local" | sudo tee /etc/resolver/minikube.local
echo "search_order 1" | sudo tee /etc/resolver/minikube.local
echo "timeout 5" | sudo tee /etc/resolver/minikube.local
sudo touch /etc/resolver