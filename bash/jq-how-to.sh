#!/bin/bash

#see https://kvz.io/bash-best-practices.html
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

#what's jq -> https://stedolan.github.io/jq/

jq . example.json

#single value
key="whatever"
jq ."$key" example.json

# how to handle arrays
key="else[]"
value=$(jq -r ."$key" example.json)
printf '%s\n' "${value[@]}"

for i in "${value[@]}"
do :
   echo "$i"
done
