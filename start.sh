#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Please enter a name for the container and also the name of the image to build from."
    echo "e.g. ./start.sh hdev haskell-devel"
    exit 1
fi

docker run --privileged --name $1 -e "PATH=/opt/ghc/7.8.3/bin/:~/.cabal/bin:$PATH" -ti -p $3:8000 $2 bash
