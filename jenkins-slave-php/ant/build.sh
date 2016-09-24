#!/bin/bash

set -e

repo="hyperhq/jenkins-slave-php"
tag=ant
image=${repo}:${tag}



function build(){
    echo "starting build..."
    echo "=============================================================="
    docker build -t ${image} .
}

function push(){
    echo -e "\nstarting push [${image}] ..."
    echo "=============================================================="
    docker push ${image}
}


case "$1" in
    "push")
        build
        push
        ;;
    "")
        build
        ;;
    *)
        cat <<EOF
usage:
    ./build.sh             # build only
    ./build.sh push        # build and push
EOF
    exit 1
        ;;
esac



echo -e "\n=============================================================="
echo "Done!"
