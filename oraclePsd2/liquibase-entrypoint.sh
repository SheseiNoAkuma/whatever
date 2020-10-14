#!/usr/bin/env bash

ENTRYPOINT_cname="${0##*/}:"

echo "$ENTRYPOINT_cname verify environment:"



usage()
{
    cat << USAGE >&2
Usage:
    $ENTRYPOINT_cname define the following environment variables:
    CONNECTION_STRING           Connection String TODO Oracle database
    CHANGE_LOG_DDL              absolute path to changeLogFile for data definition
    CHANGE_LOG_DML              absolute path to changeLogFile for data modification
    USERNAME                    owner username
    PASSWORD                    owner password
    etc...
USAGE
    exit 1
}

CLASSPATH=/liquibase/lib/ojdbc.jar

echo "$ENTRYPOINT_cname CONNECTION_STRING = $CONNECTION_STRING";
echo "$ENTRYPOINT_cname CHANGE_LOG_DDL = $CHANGE_LOG_DDL";
echo "$ENTRYPOINT_cname CHANGE_LOG_DML = $CHANGE_LOG_DML";
echo "$ENTRYPOINT_cname USERNAME = $USERNAME";
echo "$ENTRYPOINT_cname PASSWORD = $PASSWORD";
echo "$ENTRYPOINT_cname DB_OWNER = $DB_OWNER";
echo "$ENTRYPOINT_cname DB_USER = $DB_USER";
echo "$ENTRYPOINT_cname DATA_TABLE_SPACE = $DATA_TABLE_SPACE";
echo "$ENTRYPOINT_cname INDEX_TABLE_SPACE = $INDEX_TABLE_SPACE";

#TODO verificare che tutti i parametri siano valorizzati e in caso contrario interrompersi e stampare Usage

echo "$ENTRYPOINT_cname run liquibase CHANGE_LOG_DDL"
/liquibase/liquibase --url=$CONNECTION_STRING --classpath=$CLASSPATH --changeLogFile=$CHANGE_LOG_DDL --username=$USERNAME --password=$PASSWORD --contexts=owner update -Ddb.owner=$DB_OWNER -Ddb.user=$DB_USER -DtablesTablespaceName=$DATA_TABLE_SPACE -DindexesTablespaceName=$INDEX_TABLE_SPACE

echo "$ENTRYPOINT_cname run liquibase CHANGE_LOG_DML"
/liquibase/liquibase --url=$CONNECTION_STRING --classpath=$CLASSPATH --changeLogFile=$CHANGE_LOG_DML --username=$USERNAME --password=$PASSWORD --contexts=prod,test update -Ddb.owner=$DB_OWNER -Ddb.user=$DB_USER -DtablesTablespaceName=$DATA_TABLE_SPACE -DindexesTablespaceName=$INDEX_TABLE_SPACE
