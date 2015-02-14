#!/bin/bash

usage()
{
echo "$0"
}

source config

screen -dmSL workstuff expect ssh.exp $rsgIP $username $password
