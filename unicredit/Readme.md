### Create DB Oracle

1 - La cartella di lavoro che conterrà i file necessari a creare il container oracle è /home/cristian/docker/oracle (di seguito referenziata come DOCKER_ORACLE)
    E' necessario creare:
     - DOCKER_ORACLE/init/init.sql (script che crea DB_OWNER e DB_USER)
     - DOCKER_ORACLE/unicredit/oradata (che sarà montata nel container come /u01/app/oracle in modo da salvare in essa i file fisici del database di unicredit ed esporli esternamente al container)
    In DOCKER_ORACLE/unicredit/oradata creare la cartella fin_create_sql, e decomprimere in essa il contenuto della cartella db-script del file fin-ear/unicredit/target/fin-ear-unicredit-ci-develop-SNAPSHOT-openshift.zip
2 - Creare DB_OWNER e DB_USER
    Per farlo automaticamente all'avvio del container, mettere init.sql nella cartella DOCKER_ORACLE/init, che sarà montata come /docker-entrypoint-initdb.d/ nel container
3 - Avviare il docker-compose per creare il container database, basato sull'immagine quay.io/maksymbilenko/oracle-xe-11g. In questo container saranno creati automaticamente gli user DB_OWNER e DB_SCRIPT tramite il file init.sql, eseguito all'avvio del container
3 - Eseguire script di FIN per popolare gli user DB_OWNER e DB_USER
    export DOCKER_ORACLE=/home/cristian/docker/oracle
    export scriptPath=$DOCKER_ORACLE/unicredit/oradata/fin_create_sql
    export containerName=database
    sed -i "s/def ROOTDB = '<To Define>'/def ROOTDB = '\/u01\/app\/oracle\/fin_create_sql'/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    sed -i "s/def DB_OWNER = '<To Define>'/def DB_OWNER = 'DB_OWNER'/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    sed -i "s/def DB_USER = '<To Define>'/def DB_USER = 'DB_USER'/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    sed -i "s/define _CONNECT_IDENTIFIER= '<To Define>' ;/define _CONNECT_IDENTIFIER= '\/\/127.0.0.1\/XE' ;/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    sed -i "s/conn \&DB_USER@\&_CONNECT_IDENTIFIER;/conn \&DB_USER\/\&DB_USER@\&_CONNECT_IDENTIFIER;/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    sed -i "s/def ROOTDB = '<To Define>'/def ROOTDB = '\/u01\/app\/oracle\/fin_create_sql'/g" $scriptPath/FINDBInstall/LAUNCH.SQL
    sed -i "s/\/root\/jenkins/\/u01\/app\/oracle\/fin_create_sql/g" $scriptPath/FINDBPackage/LAUNCH.SQL
    docker exec $containerName sh -c "sqlplus DB_OWNER/DB_OWNER@//127.0.0.1/XE < /u01/app/oracle/fin_create_sql/FINDBPackage/LAUNCH.SQL"
    docker exec $containerName sh -c "sqlplus DB_OWNER/DB_OWNER@//127.0.0.1/XE < /u01/app/oracle/fin_create_sql/FINDBInstall/LAUNCH.SQL"
