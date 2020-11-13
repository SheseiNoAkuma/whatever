





docker login -u='6042828|tas-serviceaccount-build' -p="$Env:TOKEN_REDHAT" registry.redhat.io



oc login https://api.os4.dev.int.master.lan:6443 --token="$Env:TOKEN_OC_UNI" --insecure-skip-tls-verify
