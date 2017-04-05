# delete all container
docker ps -a | awk '{print $1}' | tail -n +2 | xargs docker rm

# delete all images
#docker rmi $(docker images | awk '/^mituba/ { print $3 }')
