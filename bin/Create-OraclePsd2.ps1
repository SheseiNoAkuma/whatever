Param(
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='also rebuild resources, $true / $false')][bool]$full=$false
    ) 

$initialpath=Get-Location

$oracle = Get-OraclePsd2 | Select-Object

#tempo di attesa per lo start di oracle all'interno del container
$sleep=40

Set-Location $oracle.path

if ($full){
    Write-Host  "re-build config before procede" -ForegroundColor Yellow
    mvn clean install -o -f $oracle.pom 
    
    Write-Host  "svuoto la cartella: $($oracle.target)" -ForegroundColor Yellow
    Remove-Item "$($oracle.target)/*" -Recurse -Force -Confirm:$false -ErrorAction Ignore

    Write-Host  "unzip liquibase scripts"
    Expand-Archive -Force $oracle.source $oracle.target

}

docker-compose rm --force

docker-compose up --build -d

Write-Host  "container is ready to go jdbc:oracle:thin:@oracle-psd2:1521:XE OWNER/OWNER" -ForegroundColor Green
