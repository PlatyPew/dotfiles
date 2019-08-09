#!/bin/zsh
NetInterface="$(route -n get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}')"

ip=$(ipconfig getifaddr $NetInterface)

if [ $? -eq 0 ]; then
	echo -e "\uf817 ${ip}"
else
	echo "\uf818 ${NetInterface} inactive"
fi
