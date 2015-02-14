#!/bin/bash

usage()
{
echo "$0"
}

source . config

echo "username: $username"
echo "password: $password"

echo "try connecting to $rsgIP"
