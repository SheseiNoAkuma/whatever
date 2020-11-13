

### Create IBMMQ

1. docker run
-p 1414:1414
-v D:\home\github\whatever\unicredit\target:/opt/mqm/config
--name ibmmq-template
-e MAXHEAP=2048 -e TZ=Europe/Rome
dkr-registry.tasgroup.it:5000/supportwas/mqseries:latest 


2. sh -c "runmqsc < /opt/mqm/config/MQ_QDef_JD.txt"

3. docker commit ibmmq-template gitlab.int.master.lan:5005/netgat/fin/fin-unicredit-ibmmq:dev

4. docker login gitlab.int.master.lan:5005

5. docker push gitlab.int.master.lan:5005/netgat/fin/fin-unicredit-ibmmq:dev

### Create DB Oracle


1. docker run -p 1515:1515 -v D:\home\github\whatever\unicredit\target\db-script:/opt/db/config --name oracle-template --shm-size 1g -e TZ=Europe/Rome -e ORACLE_PWD=oracle dkr-registry.tasgroup.it/supportwas/oracle-xe:11.2.0.2 

2. sh -c "sqlplus system/oracle@//127.0.0.1/XE AS SYSDBA <<< 'ALTER SYSTEM SET processes=200 scope=spfile;'"

.....



docker commit 9007cdb852bd gitlab.int.master.lan:5005/netgat/fin/fin-unicredit-oracle:dev



