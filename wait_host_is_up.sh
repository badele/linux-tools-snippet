#!/bin/bash

# https://serverfault.com/a/42382/171697

wait_host_is_up () {
    hostname=$1
    until ping -c1 "$hostname" >/dev/null 2>&1; do :; done &    # The "&" backgrounds it
    trap "kill $!" SIGINT
    wait $!          # Wait for the loop to exit, one way or another
    trap - SIGINT    # Remove the trap, now we're done with it
}

wait_host_is_up
