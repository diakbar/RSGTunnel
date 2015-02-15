#!/bin/bash

usage()
{
echo "$0"
}
base_dir="/root/script/RSGTunnel/"

cd $base_dir
source config

# start tunnel RSG
screen -dmS rsgTunnel expect ssh.exp $rsgIP $username $password

# tunnel OSS
#ssh -oStrictHostKeyChecking=no -oCheckHostIP=no -f -C -N -T -D0.0.0.0:7532 root@oss
autossh -oStrictHostKeyChecking=no -oCheckHostIP=no -C -M0 -f -N -T -D0.0.0.0:7532 root@oss
