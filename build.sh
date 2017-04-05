
docker build . -t mituba

# docker run -it $(docker images | awk '/^<none>/ { print $3 }')
docker run -p 8080:8080 -it mituba bash
