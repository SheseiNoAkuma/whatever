docker rm -f mongo
docker run -d --name mongo -p 27017-27019:27017-27019 mongo

#-e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret -e MONGO_INITDB_DATABASE=mongodb