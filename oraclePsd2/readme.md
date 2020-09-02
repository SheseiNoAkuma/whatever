### ~~How to build image~~

~~docker build -t microbo/oracle-xe:11 -f oracle.Dockerfile .~~

### ~~How start oracle ~~
~~docker run -d --name "oraclePsd2" -p 1521:1521 microbo/oracle-xe:11~~

~~default user is OWNER/OWNER~~

### ~~Build liquibase client~~

~~docker build -t microbo/liquibase -f liquibase.Dockerfile .~~


### Run oracle and apply changelog

docker-compose.yml up -d --build
