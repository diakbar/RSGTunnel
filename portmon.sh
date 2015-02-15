#!/bin/bash

PORT=7531
base_dir="/root/script/RSGTunnel"

killRespawn()
{
killall rsg.sh
screen -X -S rsgTunnel quit
bash $base_dir/rsg.sh
}
#check if routing to RSG is accessible
if [[ `ping -c 1 150.236.180.33 | grep ttl | wc -l` == 0 ]];then echo "route is down at `date`, exit script";exit;else echo "route to RSG is up";fi

if [[ `echo "quit" | nc -vw1 localhost $PORT 2>&1| grep succeeded | wc -l ` == 1 ]]
then
echo "port is opened"
	if [[ `ssh oss hostname | grep "jktmas60" | wc -l` == 1 ]]
	then
	echo "connection maintained"
	else
	echo "connection closed! kill and respawn!"
	killRespawn
	fi
else
echo "port is close, kill screen and respawn script"
killRespawn
fi
