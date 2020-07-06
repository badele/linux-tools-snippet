#!/bin/bash

# PROJECTID=projectid ./gcloud_total_images_size.sh.sh

source ./gcloud_commons.sh

if [ -n "$PROJECTID" ]; then
    PROJECTOPS="--project ${PROJECTID}"
fi

NB=$(gcloud ${PROJECTOPS} compute images list --no-standard-images --format text | grep archiveSizeBytes | wc -l)
GBYTES=$(echo "$(gcloud ${PROJECTOPS} compute images list --no-standard-images --format text | grep archiveSizeBytes | awk '{print $2}' | datamash sum 1)/1024^3" | bc)
COST=$(echo "$GBYTES*$IMGCOST" | bc)

echo "NB             : $NB"
echo "TOTAL IMG SIZE : $GBYTES GB"
echo "STORAGE COST   : $COST \$"
