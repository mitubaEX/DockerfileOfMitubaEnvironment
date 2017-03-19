
docker build .

docker run -it $(docker images | awk '/^<none>/ { print $3 }')
