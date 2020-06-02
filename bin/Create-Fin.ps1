Function Remove-DockerContainer {
# Parameter help description
Param(
    #container name
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='the name of the container to remove')][string]$name
    )
    $containersIds = (docker ps --all --quiet -f "name=$name"); 
    if ($containersIds.Count -gt 0)
    {
        Write-Host ("remove container: $name")
        docker rm -f $containersIds
    } else {
        Write-Host ("container <$name> does not exists")
    }
}


$initialpath=Get-Location

$basepath='D:\github\whatever\Create-Fin'

Set-Location $basepath

Remove-DockerContainer -name "mq"

docker build -t finmq .
docker run -d -p 1414:1414 -e TZ=Europe/Rome -e LICENSE=accept -e MQ_DEV=true -e MQ_QMGR_NAME=MQ --name mq ibmcom/mq

#Start-Sleep 10

#docker cp target/MQ_Scripts/MQ_QDef_JD.txt mq:/opt/mqm/config
#docker exec mq sh -c "runmqsc < /opt/mqm/config/MQ_Sec.txt"

Set-Location $initialpath



