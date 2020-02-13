#!/bin/bash
# to extract user certificate to access kubernete-dashboard to kubecfg.p12 file
# then import the file to your browser
# https://<master-ip>:<apiserver-port>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

/usr/bin/grep 'client-certificate-data' ../runtime-artifacts/admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> ../runtime-artifacts/kubecfg.crt
/usr/bin/grep 'client-key-data' ../runtime-artifacts/admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> ../runtime-artifacts/kubecfg.key
/usr/bin/openssl pkcs12 -export -clcerts -inkey ../runtime-artifacts/kubecfg.key -in ../runtime-artifacts/kubecfg.crt -out ../runtime-artifacts/kubecfg.p12 -name "kubernetes-client" -passout pass:
