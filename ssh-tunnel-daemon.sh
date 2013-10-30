#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <hosts_file>"
	exit 1
fi

source $1

for ((i=0; i < ${#HOST[@]}; i++))
do
	echo "=> Tunneling ${REMOTE_USER[$i]}@${HOST[$i]}:${REMOTE_PORT[$i]} to localhost:${LOCAL_PORT[$i]}"
	autossh -M 0 -q -N -f -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -L ${LOCAL_PORT[$i]}:localhost:${REMOTE_PORT[$i]} ${REMOTE_USER[$i]}@${HOST[$i]}
done
