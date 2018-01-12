#!/bin/bash

# exit on errors
set -e

# logs 'Hello from logger-usage.sh!' as a process called 'foo'
# with a level of notice
logger -t foo -p local0.notice 'Hello from logger-usage.sh!'

# redirect stderr and stdout to logger
echo boop 2>&1 | logger -t foo -p local0.notice

# references
# - http://man7.org/linux/man-pages/man1/logger.1.html
# - https://unix.stackexchange.com/questions/124455/linux-how-to-redirect-stdout-stderr-to-logger
