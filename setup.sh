
minikube start --vm-driver=virtualbox
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
bash apply_wp.sh