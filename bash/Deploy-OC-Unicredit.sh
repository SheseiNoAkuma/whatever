#!/bin/bash

alias oc='oc.exe'


set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Set magic variables for current file & dir
#__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
#__base="$(basename ${__file} .sh)"
#__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app
#
#arg1="${1:-}"


echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "versione iniziale: per far funzionare questo script devi definire le seguenti variabili:"
echo "ProjectHome: la root dei tuoi progetti git"
echo "RESOURCES: la directory dove TOKEN_REDHAT_REPOSITORY trovano driver e rar necessari all'applicazione"
echo "TOKEN_REDHAT_REPOSITORY: il token per la login sul repository redhat (lo trovi tra le variabili di ci di fin)"
echo "TOKEN_UNICREDIT: il token per la login sul openshift per l'applicazione unicredit (lo trovi tra le variabili di ci di fin)"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"

echo "build new image"

# shellcheck disable=SC2154
echo "$ProjectHome/fin/fin/fin-ear/unicredit/target"
# shellcheck disable=SC2154
cd "$ProjectHome/fin/fin/fin-ear/unicredit/target" || exit

unzip -o fin-ear-unicredit-ci-develop-SNAPSHOT-openshift.zip -d build-image
cd build-image || exit

# shellcheck disable=SC2154
cp "$ResourceHome"/* ./deployments

ls -l ./deployments

docker login -u='6042828|tas-serviceaccount-build' -p="$TOKEN_REDHAT" registry.redhat.io

docker build --no-cache -f Dockerfile -t gitlab.int.master.lan:5005/netgat/fin/fin-unicredit .

docker login gitlab.int.master.lan:5005

docker push gitlab.int.master.lan:5005/netgat/fin/fin-unicredit


echo "update application application openshift"

cd "$ProjectHome/fin/fin/fin-ear/unicredit/target/fin-ear-unicredit-ci-develop-SNAPSHOT-k8-deploy" || exit

oc login https://api.os4.dev.int.master.lan:6443 --token="$TOKEN_OC_UNI" --insecure-skip-tls-verify

oc apply -f .

oc rollout restart deployment/ngfin-engine
