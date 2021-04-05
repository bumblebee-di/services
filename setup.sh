
minikube start --driver=virtualbox
eval $(minikube docker-env)
docker build -t nginx_img srcs/nginx/
minikube addons enable metallb
kubectl apply -f srcs/nginx/configmap.yaml
kubectl apply -f srcs/nginx/nginx-service.yaml
kubectl apply -f srcs/nginx/nginx-deployment.yaml
eval $(minikube docker-env)
docker build -t mysql_img srcs/mysql/
kubectl apply -f srcs/mysql/mysql-pvc.yaml
kubectl apply -f srcs/mysql/mysql-service.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
eval $(minikube docker-env)
docker build -t wp_img srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress-service.yaml
kubectl apply -f srcs/wordpress/wordpress-deployment.yaml
eval $(minikube docker-env)
docker build -t php_img srcs/php/
kubectl apply -f srcs/php/phpmyadmin-service.yaml
kubectl apply -f srcs/php/phpmyadmin-deployment.yaml
# eval $(minikube docker-env)
# docker build -t ftps_img srcs/ftps/
# kubectl apply -f srcs/ftps/ftps-service.yaml
# kubectl apply -f srcs/ftps/ftps-deployment.yaml
# eval $(minikube docker-env)
# docker build -t influxdb_img srcs/influxdb/
# kubectl apply -f srcs/influxdb/influxdb-pvc.yaml
# kubectl apply -f srcs/influxdb/influxdb-service.yaml
# kubectl apply -f srcs/influxdb/influxdb-deployment.yaml
# eval $(minikube docker-env)
# docker build -t grafana_img srcs/grafana/
# kubectl apply -f srcs/grafana/grafana-service.yaml
# kubectl apply -f srcs/grafana/grafana-deployment.yaml
# eval $(minikube docker-env)
# docker build -t telegraf_img srcs/telegraf/
# kubectl apply -f srcs/telegraf/telegraf-configmap.yaml
# kubectl apply -f srcs/telegraf/telegraf-deployment.yaml
