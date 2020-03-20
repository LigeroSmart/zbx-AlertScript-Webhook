#!/bin/bash
# LigeroSmart Webhook alert script for Zabbix til 4.0.0 version
# Based on the work of Moogsoft Zabbix Webhook Script
# https://docs.moogsoft.com/en/zabbix-webhook.html
# Version 1.0 

#
# Add -k or --insecure if your Moogsoft Endpoint 
# is using a self-signed certificate
#

# Treat line breaks comming from Zabbix ensuring that we get a good json on LigeroSmart
OUTPUT=${2//$'\r'/}
OUTPUT=${OUTPUT//$'\n'/'\n'}
OUTPUT=${OUTPUT//\{\\n\"/\{\"}
OUTPUT=${OUTPUT//,\\n\"/,\"}
OUTPUT=${OUTPUT//\"\\n\}/\"\}}


HTTP_CODE=$(curl -w "%{http_code}" -k --silent --output /dev/null -H "Content-Type: application/json" "${1}" -d "${OUTPUT}")

if [[ "$HTTP_CODE" == 200 ]]
then
    exit 0
else
    exit 1
fi
