# Wiremock is the nuts :)

## opzioni di run

```java -jar wiremock-standalone-2.25.1.jar -v --local-response-templating -port 9999```

## Json validato path per usare matchesJsonPath

[Json path tool web app](http://jsonpath.herokuapp.com/)

[comment]: <> (prove fatte per registrazione con certificato client)
[comment]: <> (java -jar wiremock-standalone-2.25.1.jar -v --local-response-templating -port 8090 --https-truststore certificates/tpp.againstthewind.nexi.it.p12 --truststore-password 11111111 --proxy-all="https://cbiglobeopenbankingapigateway.nexi.it/sbx/platform/enabler/psd2orchestrator/ais/2.3.2/" --record-mappings)
[comment]: <> (--https-truststore certificates/tpp.againstthewind.nexi.it.p12 --truststore-password 11111111 --proxy-all="https://cbiglobeopenbankingapigateway.nexi.it/sbx/platform/enabler/psd2orchestrator/ais/2.3.2/" --record-mappings)
