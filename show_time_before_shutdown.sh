#!/bin/bash

# Note: you can copy/paste this code in your terminal

# Show time before shutdown
counter=0;
OLDSTATUS=$(systemctl is-system-running)
while sleep 1 ; do
    STATUS=$(systemctl is-system-running)
    if [ "$OLDSTATUS" != "$STATUS" ]; then
        counter=0
    fi
    echo "$((counter++)) $STATUS"
done
