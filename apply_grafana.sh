eval $(minikube docker-env)
docker build -t grafana_img srcs/grafana/
kubectl apply -f srcs/grafana/grafana-service.yaml
kubectl apply -f srcs/grafana/grafana-deployment.yaml