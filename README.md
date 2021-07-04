# docker-nginx
docker build -t nginx_chaochen:1.0.5 ./
docker run -d -p 80:80 -p 443:443 -p 18080:18080  --name nginx5 nginx_chaochen:1.0.5
docker exec -it ContainerId bash