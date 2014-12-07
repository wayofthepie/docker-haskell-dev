#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Please enter a name for the container and also the name of the image to build from."
    echo "e.g. ./start.sh hdev haskell-devel"
    exit 1
fi

docker run --name $1 -e "PATH=$PATH:~/.cabal/bin" -ti -p 8000:8000 $2 bash
