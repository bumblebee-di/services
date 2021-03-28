
minikube start --driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
docker build -t nginx_img srcs/nginx/
bash apply.sh
sleep 10
eval $(minikube docker-env)
docker build -t mysql_img srcs/mysql/
bash apply_sql.sh
sleep 10
eval $(minikube docker-env)
docker build -t wp_img srcs/wordpress/
bash apply_wp.sh
sleep 10
eval $(minikube docker-env)
docker build -t php_img srcs/php/
bash apply_php.sh