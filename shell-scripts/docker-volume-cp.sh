#!/bin/bash

# Script from:
# https://github.com/moby/moby/issues/25245

SOURCE=$1
DEST=$2

SOURCE_ARR=(${SOURCE//:/ })
DEST_ARR=(${DEST//:/ })

if [[ ${#SOURCE_ARR[@]} -eq 2 && ${#DEST_ARR[@]} -eq 1 ]]; then
        VOL=${SOURCE_ARR[0]}
        VOL_PATH=${SOURCE_ARR[1]}
        HOST_PATH=${DEST_ARR[0]}

        id=$(docker container create  -v $VOL:/volume hello-world)
        CMD="docker cp $id:/volume/$VOL_PATH $HOST_PATH"
        #echo "$CMD"
        $CMD
        docker rm $id

elif [[ ${#SOURCE_ARR[@]} -eq 1 && ${#DEST_ARR[@]} -eq 2 ]]; then
        VOL=${DEST_ARR[0]}
        VOL_PATH=${DEST_ARR[1]}
        HOST_PATH=${SOURCE_ARR[0]}

        id=$(docker container create --name docker_volume_cp -v $VOL:/volume hello-world)
        CMD="docker cp $HOST_PATH $id:/volume/$VOL_PATH"
        #echo "$CMD"
        $CMD
        docker rm $id
else
        echo "Usage:"
        echo " volume --> host: $0 VOLUME:VOL_PATH HOST_PATH"
        echo " host --> volume: $0 HOST_PATH VOLUME:VOL_PATH"
fi
