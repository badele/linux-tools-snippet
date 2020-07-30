#!/bin/bash

# https://serverfault.com/a/42382/171697
# # HOSTNAME=hostname./wait_host_is_up.sh.sh
# One line => until ping -c1 1.2.3.4 >/dev/null 2>&1; do :; done & trap "kill $\!" SIGINT ; wait "$\!" ; trap - SIGINT


wait_host_is_up () {
    until ping -c1 "$HOSTNAME" >/dev/null 2>&1; do :; done &    # The "&" backgrounds it
    trap "kill $!" SIGINT
    wait $!          # Wait for the loop to exit, one way or another
    trap - SIGINT    # Remove the trap, now we're done with it
}

wait_host_is_up
