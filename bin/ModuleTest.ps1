Import-Module GlobalConfig -Verbose -Force

$obj = Get-OraclePsd2 | Select-Object

Write-Host $obj

Write-Host ($obj | Format-List | Out-String)

Write-Host "container name: $($obj.container)"

$oracle = Get-OraclePsd2 | Select-Object
$sleep = 25

Remove-DockerContainer $oracle.container

docker run -p 1521:1521 -e TZ=Europe/Rome -d --shm-size=1g --name $oracle.container oracle/custom:1.0

Write-Host  "sleep $sleep sec to let $($oracle.container) start"
Start-Sleep -s $sleep

Write-Host  "customize $($oracle.container), create users modify db properties etc.."
docker exec $oracle.container sh -c "sqlplus sys/oracle@//127.0.0.1/XE AS SYSDBA < /opt/db/config/customize.sql"
