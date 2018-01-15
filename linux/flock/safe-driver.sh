#!/bin/bash

clear

for i in $(seq 3)
do 
    ( 
        echo "> BEGIN FOO $i"
        safe.sh FOO
        echo "> END FOO $i exit code: $?"
    ) & 
done

if [ ! -z "$IN_DOCKER" ]; then
    sleep 1 # allow scripts to run (needed for docker)
fi

printf "\n\njobs running (should only see one process running)\n"
jobs -l

printf "\n\nlist file locks\n"
lsof /tmp/safe*.lock

if [ ! -z "$IN_DOCKER" ]; then
    printf "\n\npausing, press any key to return early\n"
    read -r
fi