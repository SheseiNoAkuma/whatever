#FROM liquibase/liquibase:3.10.x
FROM liquibase/liquibase

USER root
RUN apt-get update && apt-get install -y netcat
USER liquibase

ADD ./config/deployments_common/ojdbc.jar /liquibase/lib/
ADD ./target/engine/liquibase /liquibase/changelog

ADD ./config/liquibase/liquibase-entrypoint.sh /liquibase
ADD ./config/liquibase/driver.properties /liquibase

USER root
RUN chmod -R 777 /liquibase
USER liquibase

ENTRYPOINT ["/bin/bash", "/liquibase/liquibase-entrypoint.sh"]
