FROM oracleinanutshell/oracle-xe-11g

ADD init.sql /docker-entrypoint-initdb.d/

#FROM dkr-registry.tasgroup.it/supportwas/oracle-xe:11.2.0.2

#ADD init.sql /docker-entrypoint-initdb.d/setup/
