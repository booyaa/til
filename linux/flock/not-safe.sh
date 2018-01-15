#!/bin/bash

#exit on errors
set -e

readonly PROGNAME=$(basename "$0" .sh)
readonly INSTANCE="$1"

if [ -z "${INSTANCE}" ]; then
        echo "Must provide an instance!"
        exit 1
fi

# to avoid command block, link file descriptor 200 to our lock file
exec {lock_fd}>"$LOCKFILE"

# write the pid to the file descriptor
echo "$$" 1>&${lock_fd}

###################################################################
## code begins here..

echo "sleeping on $INSTANCE"
sleep 5
echo "finished on $INSTANCE"
exit 0
