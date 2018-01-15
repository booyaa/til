#!/bin/bash

#exit on errors
set -e

readonly PROGNAME=$(basename "$0" .sh)
readonly LOCKFILE_DIR=/tmp
readonly INSTANCE="$1"
readonly LOCKFILE="${LOCKFILE_DIR}/${PROGNAME}-${INSTANCE}.lock"

if [ -z "${INSTANCE}" ]; then
        echo "Must provide an instance!"
        exit 1
fi

# to avoid command block, link file descriptor 200 to our lock file
# exec {lock_fd}>"$LOCKFILE" # bash 4.1
exec 200>"$LOCKFILE"

# early exit if instance is already running
# flock -n ${lock_fd} || exit 2
flock -n 200 || exit 2

###################################################################
## code begins here..
echo "sleeping on $INSTANCE"
sleep 5
echo "finished on $INSTANCE"
exit 0
