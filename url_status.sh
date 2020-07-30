#!/bin/bash

# URL="www.google.fr" TIMEOUT=0.1 url_status.sh
# One line URL="www.google.fr" TIMEOUT=0.1 ; while true; do wget --timeout $TIMEOUT --tries 1 -S "$URL" 2>&1 | grep "HTTP/" | awk '{print $2}' ; echo  -n "." ; sleep 0.1; done

while true; do wget --timeout $TIMEOUT --tries 1 -S "$URL" 2>&1 | grep "HTTP/" | awk '{print $2}' ; echo  -n "." ; sleep 0.1; done
