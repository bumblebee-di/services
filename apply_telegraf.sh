eval $(minikube docker-env)
docker build -t telegraf_img srcs/telegraf/
kubectl apply -f srcs/telegraf/telegraf-configmap.yaml
kubectl apply -f srcs/telegraf/telegraf-deployment.yaml