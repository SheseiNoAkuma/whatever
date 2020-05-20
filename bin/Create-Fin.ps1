$initialpath=Get-Location

$basepath='D:\github\whatever\Create-Fin'

Set-Location $basepath

docker rm mq-fin
docker run -d -p 1414:1414 -e TZ=Europe/Rome -e MAXHEAP=2048 --network="fin" --network-alias="mq" --name mq-fin dkr-registry.tasgroup.it:5000/supportwas/mqseries

Start-Sleep 10

docker cp target/MQ_Scripts/MQ_QDef_JD.txt mq:/opt/mqm/config
docker exec mq sh -c "runmqsc < /opt/mqm/config/MQ_Sec.txt"

Set-Location $initialpath