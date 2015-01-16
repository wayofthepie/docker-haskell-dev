#!/bin/bash
. ./env.conf

if [ ! -z "$GIT_USER" ]; then
   echo "Setting git user name to $GIT_USER ..."
   git config --global user.name $GIT_USER
fi

if [ ! -z "$GIT_EMAIL" ]; then
    echo "Setting git email to $GIT_EMAIL ..."
    git config --global user.email $GIT_EMAIL
fi

if [ ! -z "$REPOS" ]; then
    cd /opt/repos 
    for r in ${REPOS[@]}; do
        echo "Cloning $r into /opt/repos ..."
        git clone $r
    done
fi
