#!/usr/bin/env bash

# this script will try to reconnect VPN if it's down, running in an endless loop. 
# it will also try to reconnect a Wifi network if one is defined
# finally, if it detects an office wired connection - it will exit w/o doing anything

set -e
set -u

wifi_name='' # leave completely empty (w/o quotes) to skip wifi reconnection attempts 
vpn_name='test' 
office_name="my-office-connection"
url_ping_test="www.google.com"

# check office wired connection
if nmcli connection status | grep -q "${office_name}"; then
  office_connection=$(nmcli con status id "${office_name}" | grep GENERAL.STATE|awk -F: '{print $NF}'|sed 's/ //g')
  if [[ ${office_connection} == "activated" ]] ;then 
    echo "connected to office network: '${office_name}' - exiting"
    exit 0
  fi
fi

echo "starting vpn keep-alive..."
# main loop
while [ 1 ] ;do
  if ! ping -c1 ${url_ping_test} &>/dev/null; then
     if [[ $wifi_name != "" ]]; then
       echo "`date +%Y-%m-%d:%H:%M:%S` oh no, ping failed - trying to bring WiFi back up..."
       nmcli nm wifi on
       nmcli c up id $wifi_name
     fi
  else
     status=$(nmcli con status id ${vpn_name} |grep GENERAL.STATE|awk -F: '{print $NF}'|sed 's/ //g')
     if [[ ${status} !=  "activated" ]] ;then
        echo "`date +%Y-%m-%d:%H:%M:%S` oh oh, VPN disconnection detected, trying to reconnect..."
        nmcli con up id ${vpn_name}
     fi
  fi
  sleep 5 
done

