# docker-nginx
# build image
docker build -t nginx_chaochen:1.0.5 ./

# start the image and run as container
docker run -d -p 80:80 -p 443:443 -p 18080:18080  --name nginx5 nginx_chaochen:1.0.5

# enter container and show with shell
docker exec -it ContainerId bash