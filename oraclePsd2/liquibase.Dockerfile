FROM liquibase/liquibase:3.10.x

ADD driver/ojdbc.jar /liquibase/lib/
ADD target/eu/tasgroup/psd2/db/changelog eu/tasgroup/psd2/db/changelog
ADD liquibase.init.sh /liquibase

CMD /liquibase/liquibase.init.sh
