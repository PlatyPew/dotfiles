#!/bin/zsh

res=$(curl -s ipinfo.io)

if [ $? -eq 0 ]; then
	ipaddr=$(echo $res | grep ip | awk '{print $2}' | cut -d '"' -f 2)
	code=$(echo $res | grep country | awk '{print $2}' | cut -d '"' -f 2)
	echo "\uf0ac ${ipaddr} @ ${code}"
else
	echo '\uf071 No Internet Access'
fi
