#!/bin/bash

usage()
{
echo "$0"
}

source config

screen -dmS workstuff expect ssh.exp $rsgIP $username $password
