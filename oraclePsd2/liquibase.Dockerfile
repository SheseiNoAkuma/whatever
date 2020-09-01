FROM liquibase/liquibase:3.10.x

ADD driver/ojdbc.jar /liquibase/lib/
ADD target/eu/tasgroup/psd2/db/changelog /liquibase/changelog
