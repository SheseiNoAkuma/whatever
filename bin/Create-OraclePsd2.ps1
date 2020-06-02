Param(
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='also rebuild resources, $true / $false')][bool]$full=$false
    ) 

$initialpath=Get-Location

$oracle = Get-OraclePsd2 | Select-Object

#tempo di attesa per lo start di oracle all'interno del container
$sleep=25

Set-Location $oracle.path

if ($full){
    Write-Host  "re-build config before procede" -ForegroundColor Yellow
    mvn clean install -o -f $oracle.pom 
    
    Write-Host  "svuoto la cartella: $($oracle.target)" -ForegroundColor Yellow
    Remove-Item "$($oracle.target)/*" -Recurse -Force -Confirm:$false -ErrorAction Ignore

    Write-Host  "unzip liquibase scripts"
    Expand-Archive -Force $oracle.source $oracle.target

    Copy-Item .\liquibase.properties $oracle.target
}

Remove-DockerContainer $oracle.container

docker build -t oracle/custom:1.0 .
docker run -p 1521:1521 -e TZ=Europe/Rome -d --shm-size=1g --name $oracle.container oracle/custom:1.0

Write-Host  "sleep $sleep sec to let $($oracle.container) start"
Start-Sleep -s $sleep

Write-Host  "customize $($oracle.container), create users modify db properties etc.."
docker exec $oracle.container sh -c "sqlplus sys/oracle@//127.0.0.1/XE AS SYSDBA < /opt/db/config/customize.sql"

Write-Host  "Restart docker container $($oracle.container)" 
docker restart $oracle.container

Write-Host  "sleep $sleep sec to let $($oracle.container) restart properly"
Start-Sleep -s $sleep

Write-Host "Liquibase here we go, by the way you shoul put --logLevel flag option for more details"

Set-Location $oracle.target
liquibase --changeLogFile=\eu\tasgroup\psd2\db\changelog\db.changelog-DDL-master.xml --contexts=owner update 
liquibase --changeLogFile=\eu\tasgroup\psd2\db\changelog\db.changelog-DML-master.xml --contexts=prod,test update 
Set-Location $initialpath

Write-Host  "Remember you should only use JENKINS_OWNER to acces the DB, JENKINS_USER has no SYNONYMOUS" -ForegroundColor Red
Write-Host  "container $($oracle.container) is ready to go on port 1521" -ForegroundColor Green