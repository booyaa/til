#!/bin/bash

for i in $(seq 3)
do 
    ( 
        echo "BEGIN FOO $i"
        safe.sh FOO
        echo "END FOO $i exit code: $?"
    ) & 
done

sleep 1 # allow scripts to run

echo processes running
jobs -l

echo list any pid files
ls /tmp/safe*

echo "PID of running: $(cat /tmp/safe-*)"

echo pausing, press any key to return early
read