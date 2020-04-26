# Istruzioni

## eseguire sul DB per as DBA USER

### as DBA

GRANT CREATE TABLE TO JENKINS_USER;
ALTER USER JENKINS_USER quota unlimited on TD_JENKINS;

### as OWNER to delete synonyms

DROP SYNONYM JENKINS_USER.ACTIONS FORCE;

## esecuzione di liquibase

liquibase --changeLogFile=changelog-synonyms.xml --logLevel flag update
