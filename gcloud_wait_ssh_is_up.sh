#!/bin/bash

# https://stackoverflow.com/a/36094341/2015612
# PROJECTID=projectid ZONE=zone HOSTNAME=hostname ./gcloud_get_internal_instances_ip_by_tag.sh
# One line => PROJECTID=projectid ZONE=zone HOSTNAME=hostname ; until gcloud --project ${PROJECTID} compute ssh "${HOSTNAME}" --strict-host-key-checking no --command "echo instance now up" --zone ${ZONE} >/dev/null 2>&1; do :; done & trap "kill $\!" SIGINT ; wait "$\!" ; trap - SIGINT

wait_ssh_is_up () {
    until gcloud --project ${PROJECTID} compute ssh "${HOSTNAME}" --strict-host-key-checking no --command "echo instance now up" --zone ${ZONE} >/dev/null 2>&1; do :; done &
    trap "kill $!" SIGINT
    wait $!
    trap - SIGINT
}

wait_ssh_is_up
