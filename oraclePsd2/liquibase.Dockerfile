FROM liquibase/liquibase:3.10.x

USER root
RUN apt-get update && apt-get install -y netcat
USER liquibase

ADD driver /liquibase/lib/
ADD target/eu/tasgroup/psd2/db/changelog eu/tasgroup/psd2/db/changelog

ADD wait-for-it.sh /bin
ADD liquibase-entrypoint.sh /liquibase
