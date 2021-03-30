# kubectl apply -f srcs/mysql/mysql-pvc.yaml
# kubectl apply -f srcs/mysql/secret.yaml
kubectl apply -f srcs/mysql/mysql-service.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml