#!/usr/bin/env bash

set -e
set -u

wifi_name='my-wifi'
conn_name='my-VPN'

while [ 1 ] ;do
  if ! ping -c1 www.google.com &>/dev/null; then
     echo "`date` oh no, ping failed - trying to bring WiFi back up..."
     nmcli nm wifi on
  else
     status=$(nmcli con status id ${conn_name} |grep GENERAL.STATE|awk -F: '{print $NF}'|sed 's/ //g')
     if [[ ${status} !=  "activated" ]] ;then
        echo "`date` oh oh, VPN disconnection detected, trying to reconnect..."
        nmcli con up id ${conn_name}
     fi
  fi
  sleep 5 
done

