#!/bin/bash

# [PROJECTID=projectid] [TAG=tagname] FIELD=internal_ip ./gcloud_get_internal_instances_ip_by_tag.sh

if [ -n "$PROJECTID" ]; then
    PROJECTOPS="--project ${PROJECTID}"
fi

if [ -n "$TAG" ]; then
    TAGOPS="--filter='tags.items=${TAG}'"
fi


if [ "$FIELD" = "internal_ip" ]; then
    FORMAT="value(networkInterfaces[0].networkIP)"
fi

if [ "$FIELD" = "instance_name" ]; then
    FORMAT="value(name)"
fi

gcloud ${PROJECTOPS} "--format=$FORMAT" compute instances list ${TAGOPS}
