$DebugPreference = "Continue"
$initialpath=Get-Location

#nome del container
$container="keycloak"
#path assoluto della folder che contiene le risorse (Dockerfile, realm-import.json etc..) 
$basepath='D:\docker\Create-Keycloak'

Set-Location $basepath

docker build -t keycloack/custom:1.0 .

docker rm -f $container
docker run -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e JAVA_OPTS="-Xmx2048m -XX:MaxMetaspaceSize=1024m -Djava.net.preferIPv4Stack=true -Dorg.apache.activemq.SERIALIZABLE_PACKAGES=* -Dkeycloak.profile.feature.upload_scripts=enabled -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/shared/realm-import.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING -Djboss.socket.binding.port-offset=100" -e DB_VENDOR=h2 -p 8180:8180 -p 10090:10090 -d --name $container keycloack/custom:1.0

Write-Debug  "container $container is ready to go on port 8180"

Set-Location $initialpath