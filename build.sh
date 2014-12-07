#!/bin/bash

if [ -z $1 ]; then
    echo "Please enter a name for the image to build."
    echo "e.g.: ./build.sh haskell-devel"
    exit 1
fi

docker build -t $1 .
