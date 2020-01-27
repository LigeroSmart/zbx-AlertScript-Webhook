#!/bin/bash
# LigeroSmart Webhook alert script for Zabbix til 4.0.0 version
# Based on the work of Moogsoft Zabbix Webhook Script
# https://docs.moogsoft.com/en/zabbix-webhook.html
# Version 1.0 

#
# Add -k or --insecure if your Moogsoft Endpoint 
# is using a self-signed certificate
#
HTTP_CODE=$(curl -w "%{http_code}" --silent --output /dev/null -H "Content-Type: application/json" "${1}" -d "${2}")

if [[ "$HTTP_CODE" == 200 ]]
then
    exit 0
else
    exit 1
fi
