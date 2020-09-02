FROM liquibase/liquibase:3.10.x

USER root
RUN apt-get update && apt-get install -y netcat
USER liquibase

ADD driver/ojdbc.jar /liquibase/lib/
ADD target/eu/tasgroup/psd2/db/changelog eu/tasgroup/psd2/db/changelog

ADD wait-for-it.sh /bin
