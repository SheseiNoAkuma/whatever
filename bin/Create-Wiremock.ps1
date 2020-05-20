$DebugPreference = "Continue"
$initialpath=Get-Location

#nome del container
$container="wiremock"
#path assoluto della folder che contiene le risorse (Dockerfile) 
$basepath='D:\github\whatever\wiremock'

Set-Location $basepath

docker build --tag wiremock:custom .

docker rm -f $container
docker run -p 9999:9999 -d --name $container wiremock:custom

Write-Debug  "container $container is ready to go on port 9999"

Set-Location $initialpath