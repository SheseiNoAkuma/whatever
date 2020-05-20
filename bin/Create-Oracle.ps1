Param(
    #container name
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='the parameter name default is oracle')][string]$container='oracle',
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='also rebuild resources, $true / $false')][bool]$full=$false
    ) 

$DebugPreference = "Continue"
$initialpath=Get-Location

################################## NOTE ####################################################
# questo script crea un database oracle locale sulla porta 1515 con il solo utente JENKINS_OWNER e la struttura ed i dati di tpp 
#prerequisiti per il corretto funzionamento:
## liquibase si deve trovare nel classpath (io uso la versione 3.8.7)
## nel file liquibase.properties va indicato il parh assoluto del file ojdbc.jar

#nome del container

#path assoluto della folder che contiene le risorse (Dockerfile, liquibase.properties etc..) 
$basepath='D:\github\whatever\Create-Oracle'
#path assoluto della folder che contiene il progetto psd2
$psd2path='D:\git\psd2'
#tempo di attesa per lo start di oracle all'interno del container
$sleep=25

Set-Location $basepath

if ($full){
    Write-Debug  "re-build config before procede"
    mvn clean install -o -f  "${psd2path}\psd2-tpp-config\pom.xml"
}


Write-Debug  "rimuovo la target: $basepath '\target'"
Remove-Item ${basepath}'\target' -Recurse -Force -Confirm:$false -ErrorAction Ignore
New-item ${basepath}'\target' -itemtype directory

Write-Debug  "distruggo la macchina docker e la ricreo"
docker rm -f $container

docker build -t oracle/custom:1.0 .
docker run -p 1521:1521 -e TZ=Europe/Rome -d --shm-size=1g --name $container oracle/custom:1.0

Write-Debug  "sleep $sleep sec to let $container start"
Start-Sleep -s $sleep

Write-Debug  "customize $container, create users modify db properties etc.."
docker exec $container sh -c "sqlplus sys/oracle@//127.0.0.1/XE AS SYSDBA < /opt/db/config/customize.sql"

Write-Debug  "Restart docker container $container" 
docker restart $container

Write-Debug  "sleep $sleep sec to let $container restart"
Start-Sleep -s $sleep

Write-Debug  "unzip liquibase scripts"
Expand-Archive -Force ${psd2path}\psd2-tpp-config\target\*.zip ${basepath}'\target'

Write-Debug "Liquibase here we go, by the way you shoul put --logLevel flag option for more details"

Copy-Item .\liquibase.properties ${basepath}'\target'
Set-Location ${basepath}'\target'
liquibase --changeLogFile=\eu\tasgroup\psd2\db\changelog\db.changelog-DDL-master.xml --contexts=owner update 
liquibase --changeLogFile=\eu\tasgroup\psd2\db\changelog\db.changelog-DML-master.xml --contexts=prod,test update 
Set-Location $initialpath

Write-Debug  "Ready to go baby"
Write-Debug  "Remember you should only use JENKINS_OWNER to acces the DB, JENKINS_USER has no SYNONYMOUS"
