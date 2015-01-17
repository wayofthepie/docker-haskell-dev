#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Please enter a name for the container, the name of the image to build from and the port to map."
    echo "e.g. ./start.sh hdev haskell-devel 8000"
    exit 1
fi

docker run --privileged --name $1 -e "PATH=~/.cabal/bin:$PATH" -ti -p $3:8000 $2 bash
