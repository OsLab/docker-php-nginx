#!/bin/bash

ROOT_DIRECTORY=`pwd`
source $ROOT_DIRECTORY/vars

for REPOSITORY in $REPOSITORIES; do
    for TAG in $TAGS; do
        for VARI in $VARIANT; do
            if [ -d "$ROOT_DIRECTORY/$REPOSITORY/$TAG/$VARI" ]; then
                echo $"---> Building variant $NAMESPACE:$TAG-$VARI"$'\n'
                docker build --compress -t $NAMESPACE:$TAG-$VARI -f $ROOT_DIRECTORY/$REPOSITORY/$TAG/$VARI/Dockerfile .
            fi
        done
    done
done
