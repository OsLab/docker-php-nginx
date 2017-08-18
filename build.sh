#!/bin/bash

# for returning later to the main directory
ROOT_DIRECTORY=`pwd`

# read repository configuration
source $ROOT_DIRECTORY/vars

# for each enabled repository
for REPOSITORY in $REPOSITORIES; do
    # read repository configuration
    source $ROOT_DIRECTORY/vars

    # build all enabled versions
    for TAG in $TAGS; do
        # some verbose
        echo $'\n\n'"--> Building $NAMESPACE:$TAG"$'\n'

        for VARI in $VARIANT; do
            if [ -d "$ROOT_DIRECTORY/$REPOSITORY/$TAG/$VARI" ]; then
                echo $"---> Building variant $NAMESPACE:$TAG-$VARI"$'\n'
                docker build -q -t $NAMESPACE:$TAG-$VARI -f $ROOT_DIRECTORY/$REPOSITORY/$TAG/$VARI/Dockerfile .
            fi
        done
    done
done
