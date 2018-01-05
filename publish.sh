#!/bin/bash

ROOT_DIRECTORY=`pwd`
source $ROOT_DIRECTORY/vars

for REPOSITORY in $REPOSITORIES; do
    for TAG in $TAGS; do
        for VARI in $VARIANT; do
            if [ -d "$ROOT_DIRECTORY/$REPOSITORY/$TAG/$VARI" ]; then
                echo $'\n\n'"--> Publishing variant $NAMESPACE-$REPOSITORY:$TAG-$VARI"$'\n'
               docker push $NAMESPACE:$TAG-$VARI
            fi
        done
    done
done
