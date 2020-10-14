# Oracle XE database

Oracle XE database image, based on the official dockerfile at
https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance

The _official_ `oracle/database:11.2.0.2-xe` image isn't available on Docker Hub,
you can build it with:

```
cd /var/tmp
git clone https://github.com/oracle/docker-images.git
cd docker-images/OracleDatabase/SingleInstance/dockerfiles
MYREPO="/my/software/stuff"
cp "$MYREPO/oracle-xe-11.2.0-1.0.x86_64.rpm.zip" ./11.2.0.2/
./buildDockerImage.sh -v 11.2.0.2 -x
cd /var/tmp/ && rm -rf docker-images
```

The TAS image is a verbatim build of the official one plus a DDL for enabling XA.

## Tags
### Supported tags

 * 11.2.0.2

### Deprecated tags

 * 11.2 (older version)


## Run
```bash
docker run \
  --shm-size=1g \
  --name oracle-xe \
  -e ORACLE_PWD=oracle \
  -p 1521:1521 \
  -d \
  dkr-registry.tasgroup.it/supportwas/oracle-xe:11.2.0.2
```

The above will get you:
* The RDBMS listening on 1521 public port
* The `SYS` and `SYSTEM` admin users with password `oracle`
* XA enabled

## Connecting

The startup time is about 90s; be patient before attempting the first connection.

### Connect via JDBC
```
jdbc:oracle:thin:@127.0.0.1:1521:XE
```

#### Connect via TNS via network

Without editing tnsnames.ora, use:
```
sqlplus system/oracle@//127.0.0.1/XE
```

### Connect via TNS with a side container
Run sqlplus in a side container linked with the DB with something like:
```bash
docker run \
  -ti --rm \
  -e NLS_LANG=.AL32UTF8 \
  --link oracle-xe:oracle-xe \
  --workdir /opt \
  -v `pwd`:/opt \
  dkr-registry.tasgroup.it/supportwas/oracle-xe:11.2.0.2 sqlplus sys/oracle@//oracle-xe/XE as SYSDBA
```

### Connect exec'ing inside the container
```bash
docker exec -i oracle-xe sqlplus system/oracle@XE
```

## Running scripts

All the scripts in the /docker-entrypoint-initdb.d/setup/ directory inside the container are automatically run
at container startup. Feel free to either augment the image `ADD`ing your scripts there or mounting
a local directory over it.

In the latter case mind that you'll find there a `0000_enable-xa.sql` for enabling XA that you
might want to preserve.

More details on this feature at 
https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance#running-scripts-after-setup-and-on-startup

## SELinux

If using SElinux on the host, ensure that there is a policy allowing the container to access all the resources (cfr tmpfs)
