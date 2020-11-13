#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

projects=/mnt/d/home/git
whatever=/mnt/d/home/github/whatever

echo $projects

echo "re-build config before procedure"

#mvn clean install -o -f "$projects/psd2/psd2-tpp-config/pom.xml"

rm -fr "$whatever/oraclePsd2/target"

unzip "$projects/psd2/psd2-tpp-config/target/psd2-tpp-config-ci-develop-SNAPSHOT-DB.zip" -d "$whatever/oraclePsd2/target"

cp "$whatever/oraclePsd2/liquibase.properties" "$whatever/oraclePsd2/target"

cd "$whatever/oraclePsd2/" || exit

sudo docker build -t microbo/oracle-xe:11 -f oracle.Dockerfile .

sudo docker build -t microbo/liquibase -f liquibase.Dockerfile .
