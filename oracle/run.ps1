docker run -d -it -p 1521:1521 -e "DB_SID=XE" --name oracle store/oracle/database-enterprise:12.2.0.1-slim




docker run -ti --rm store/oracle/database-instantclient:12.2.0.1 sqlplus sys/Oradoc_db1@localhost/XE AS DBA

docker run -ti --rm store/oracle/database-instantclient:12.2.0.1 sqlplus hr/welcome@example.com/pdborcl


docker exec $oracle.container sh -c "sqlplus sys/Oradoc_db1@//127.0.0.1/XE AS SYSDBA < /opt/db/config/customize.sql"