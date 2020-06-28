#!/bin/bash

# PROJECTID=projectid TAG=tagname FIELD=internal_ip ./gcloud_get_internal_instances_ip_by_tag.sh


if [ "$FIELD" = "internal_ip" ]; then
    FORMAT="value(networkInterfaces[0].networkIP)"
fi

if [ "$FIELD" = "instance_name" ]; then
    FORMAT="value(name)"
fi

gcloud --project ${PROJECTID} "--format=$FORMAT" compute instances list --filter="tags.items=${TAG}"
