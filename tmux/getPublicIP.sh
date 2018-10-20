#!/bin/zsh

res=$(dig +short myip.opendns.com @resolver1.opendns.com)

if [ $? -eq 0 ]; then
	echo "\uf0ac ${res}"
else
	echo '\uf071 No Internet Access'
fi
