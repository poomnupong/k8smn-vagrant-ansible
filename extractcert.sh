#!/bin/bash
# to extract user certificate to access kubernete-dashboard to kubecfg.p12 file
# then import the file to your browser
# https://<master-ip>:<apiserver-port>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

/usr/bin/grep 'client-certificate-data' ./admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.crt
/usr/bin/grep 'client-key-data' ./admin.conf | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.key
/usr/bin/openssl pkcs12 -export -clcerts -inkey kubecfg.key -in kubecfg.crt -out kubecfg.p12 -name "kubernetes-client"
