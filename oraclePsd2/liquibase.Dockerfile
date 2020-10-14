FROM liquibase/liquibase:3.10.x

USER root
RUN apt-get update && apt-get install -y netcat
USER liquibase

ADD driver /liquibase/lib/
ADD target/eu/tasgroup/psd2/db/changelog eu/tasgroup/psd2/db/changelog

ADD wait-for-it.sh /liquibase
ADD liquibase-entrypoint.sh /liquibase

#FIXME questoo glielo posso passare da cmpose
ENTRYPOINT ["/bin/bash", "/liquibase/wait-for-it.sh","oracle-psd2:8080","--timeout=0","--strict", "--", "/liquibase/liquibase-entrypoint.sh" ]
