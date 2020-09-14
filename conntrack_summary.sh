#!/bin/bash

# Show current conntrack summary

while true; do
    RESULT=$(conntrack -L)

    date +"%Y-%m-%d %H:%M:%S"
    echo "== Protocols =="
    echo "$RESULT" | grep tcp | awk '{ print $1}' | sort | uniq -c | sort -n

    echo "== TCP states =="
    echo "$RESULT" | grep tcp | awk '{ print $4}' | sort | uniq -c | sort -n

    echo "== TCP dst=="
    echo "$RESULT" | grep tcp | awk '{ print $4 $5 $6}' | sort | uniq -c | sort -n

    echo "== UDP dst=="
    echo "$RESULT" | grep udp | awk '{ print $5}' | sort | uniq -c | sort -n

    echo "===================================================================================="

    sleep 1
done
