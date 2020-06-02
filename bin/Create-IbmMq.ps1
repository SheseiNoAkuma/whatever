

#https://github.com/ibm-messaging/mq-jms-spring

Remove-DockerContainer mq

docker run -d -p 1414:1414 -p 9443:9443 -e TZ=Europe/Rome -e LICENSE=accept -e MQ_DEV=true -e MQ_QMGR_NAME=MQ --name mq ibmcom/mq