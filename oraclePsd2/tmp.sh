#!/bin/sh

#projects=/home/righim/git
whatever=/home/righim/github/whatever

cd "$whatever/oraclePsd2/" || exit

sudo docker build --tag microbo/oracle -f oracle.Dockerfile .

sudo docker build --tag microbo/liquibase:psd2 -f liquibase.Dockerfile .

sudo docker network create --driver bridge oracle_psd2 || true

sudo docker rm -f oracle-psd2 || true
sudo docker run -d -p 1521:1521 --name oracle-psd2 --network oracle_psd2 microbo/oracle

sudo docker rm -f liquibase || true
sudo docker run -d -e CONNECTION_STRING=jdbc:oracle:thin:@oracle-psd2:1521:XE -e CHANGE_LOG_DDL=eu/tasgroup/psd2/db/changelog/db.changelog-DDL-master.xml -e CHANGE_LOG_DML=eu/tasgroup/psd2/db/changelog/db.changelog-DML-master.xml -e USERNAME=OWNER -e PASSWORD=OWNER -e DB_OWNER=OWNER -e DB_USER=OWNER -e DATA_TABLE_SPACE=TS_DATA -e INDEX_TABLE_SPACE=TS_INDEX --name liquibase --network oracle_psd2 microbo/liquibase:psd2
