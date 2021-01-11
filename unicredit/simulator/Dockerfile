# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
# copy __files into image
#COPY __files /__files
# copy mappings into image
COPY mappings /mappings
# copy service into image
COPY wiremock-standalone-2.27.2.jar /wiremock-standalone.jar
# run application with this command line 
CMD /usr/bin/java -jar ./wiremock-standalone.jar -v --local-response-templating -port 8088
