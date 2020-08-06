
Remove-DockerContainer ibmmq

docker run -p 1414:1414 -e TZ=Europe/Rome -e MAXHEAP=2048 --name ibmmq dkr-registry.tasgroup.it:5000/supportwas/mqseries