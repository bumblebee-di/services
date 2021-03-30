eval $(minikube docker-env)
docker build -t influxdb_img srcs/influxdb/
# kubectl apply -f srcs/influxdb/influxdb-pvc.yaml
kubectl apply -f srcs/influxdb/influxdb-service.yaml
kubectl apply -f srcs/influxdb/influxdb-deployment.yaml