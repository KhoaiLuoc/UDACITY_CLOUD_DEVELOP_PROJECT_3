# kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl delete deployment backend-user
kubectl delete services backend-user
kubectl delete deployment backend-feed
kubectl delete services backend-feed
kubectl delete deployment reverseproxy
kubectl delete services reverseproxy
kubectl delete services reverseproxy-ep 

# 
# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f backend-user-service.yaml 
kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f reverseproxy-service.yaml

kubectl expose deployment reverseproxy --type=LoadBalancer --name=reverseproxy-ep --port=8080

# kubectl get deployment
# kubectl get services
# kubectl get pods

# Metrics pods usages and autoscale (optional)
# kubectl autoscale deployment backend-user --cpu-percent=70 --min=1 --max=3
# kubectl get deployment metrics-server -n kube-system
