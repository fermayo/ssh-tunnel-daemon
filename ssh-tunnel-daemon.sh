#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <hosts_file>"
	exit 1
fi

source $1

for ((i=0; i < ${#HOST[@]}; i++))
do
	echo "=> Tunneling localhost:${LOCAL_PORT[$i]} to ${REMOTE_USER[$i]}@${HOST[$i]}:${REMOTE_PORT[$i]}"
	autossh -M 0 -q -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -o "StrictHostKeyChecking no" -L ${LOCAL_PORT[$i]}:localhost:${REMOTE_PORT[$i]} ${REMOTE_USER[$i]}@${HOST[$i]} &
done

for job in `jobs -p`
do
	wait $job
done

echo "=> Exiting"
