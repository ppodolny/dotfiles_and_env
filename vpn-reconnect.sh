#!/usr/bin/env bash

set -e
set -u

conn_name='nrgene'

while [ 1 ] ;do
  status=$(nmcli con status id ${conn_name} |grep GENERAL.STATE|awk -F: '{print $NF}'|sed 's/ //g')
  if [[ ${status} !=  "activated" ]] ;then
     echo "`date` oh oh, disconnection detected, trying to reconnect..."
     nmcli con up id ${conn_name}
  fi
  sleep 5 
done
