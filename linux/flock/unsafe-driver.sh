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
    sleep 1 # allow scripts to run (if using docker run with remove after run switch: --rm)
fi

printf "\n\njobs running (should see all scripts running)\n"
jobs -l

if [ ! -z "$IN_DOCKER" ]; then
    printf "\n\npausing, press any key to return early\n"
    read -r
fi