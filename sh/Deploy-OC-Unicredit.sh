#!/bin/sh

echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "versione iniziale: per far funzionare questo script devi definire le seguenti variabili:"
echo "PROJECT_HOME: la root dei tuoi progetti git"
echo "RESOURCES: la directory dove TOKEN_REDHAT_REPOSITORY trovano driver e rar necessari all'applicazione"
echo "TOKEN_REDHAT_REPOSITORY: il token per la login sul repository redhat (lo trovi tra le variabili di ci di fin)"
echo "TOKEN_UNICREDIT: il token per la login sul openshift per l'applicazione unicredit (lo trovi tra le variabili di ci di fin)"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"


echo "build new image"

cd "$PROJECT_HOME/fin/fin/fin-ear/unicredit/target" || exit

unzip -o fin-ear-unicredit-ci-develop-SNAPSHOT-openshift.zip -d build-image
cd build-image || exit

cp "$RESOURCES"/* ./deployments

ls -l ./deployments

sudo docker login -u='6042828|tas-serviceaccount-build' -p="$TOKEN_REDHAT_REPOSITORY" registry.redhat.io

sudo docker build --no-cache -f Dockerfile -t gitlab.int.master.lan:5005/netgat/fin/fin-unicredit .

sudo docker login gitlab.int.master.lan:5005

sudo docker push gitlab.int.master.lan:5005/netgat/fin/fin-unicredit


echo "update application application openshift"

cd "$PROJECT_HOME/fin/fin/fin-ear/unicredit/target/fin-ear-unicredit-ci-develop-SNAPSHOT-k8-deploy" || exit

oc login https://api.os4.dev.int.master.lan:6443 --token="$TOKEN_UNICREDIT" --insecure-skip-tls-verify

oc apply -f .

oc rollout restart deployment/ngfin
