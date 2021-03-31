
minikube start --driver=virtualbox
# kubectl apply -f srcs/mysql/mysql-pvc.yaml
# kubectl apply -f srcs/influxdb/influxdb-pvc.yaml
eval $(minikube docker-env)
docker build -t nginx_img srcs/nginx/
minikube addons enable metallb
bash apply.sh
eval $(minikube docker-env)
docker build -t mysql_img srcs/mysql/
bash apply_sql.sh
eval $(minikube docker-env)
docker build -t wp_img srcs/wordpress/
bash apply_wp.sh
eval $(minikube docker-env)
docker build -t php_img srcs/php/
bash apply_php.sh
# eval $(minikube docker-env)
# docker build -t influxdb_img srcs/influxdb/
# bash apply_influxdb.sh
# eval $(minikube docker-env)
# docker build -t grafana_img srcs/grafana/
# bash apply_grafana.sh
# kubectl apply -f srcs/nginx/configmap.yaml
# kubectl apply -f srcs/nginx/nginx-service.yaml
# kubectl apply -f srcs/mysql/mysql-service.yaml
# kubectl apply -f srcs/php/phpmyadmin-service.yaml
# kubectl apply -f srcs/wordpress/wordpress-service.yaml
# kubectl apply -f srcs/influxdb/influxdb-service.yaml
# kubectl apply -f srcs/grafana/grafana-service.yaml
# kubectl apply -f srcs/nginx/nginx-deployment.yaml
# kubectl apply -f srcs/mysql/mysql-deployment.yaml
# kubectl apply -f srcs/php/phpmyadmin-deployment.yaml
# kubectl apply -f srcs/wordpress/wordpress-deployment.yaml
# kubectl apply -f srcs/influxdb/influxdb-deployment.yaml
# kubectl apply -f srcs/grafana/grafana-deployment.yaml