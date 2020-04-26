FROM jboss/keycloak

COPY realm-import.json /shared/realm-import.json
COPY zuul-signing-crt.jks /keystore/zuul-signing-crt.jks

RUN chmod -R 777 /opt/jboss
