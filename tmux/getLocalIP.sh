#!/bin/zsh
NetInterface='en0'

ip=$(ipconfig getifaddr $NetInterface)

if [ $? -eq 0 ]; then
	echo -e "\uf817 ${ip}"
else
	echo "\uf818 ${NetInterface} inactive"
fi
