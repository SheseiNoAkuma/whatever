FROM dkr-registry.tasgroup.it:5000/supportwas/oracle-xe:11.2

RUN mkdir -p /opt/db/config
COPY customize.sql /opt/db/config/customize.sql

#FROM store/oracle/database-enterprise:12.2.0.1-slim

#USER root

#RUN mkdir -p /opt/db/config
#COPY customize.sql /opt/db/config/customize.sql

#RUN chmod -R 777 /opt/