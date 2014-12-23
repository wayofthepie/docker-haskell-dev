#!/bin/bash

source ./env.conf

[ ! -z "$GIT_USER" ] && git config --global user.name $GIT_USER

[ ! -z "$GIT_EMAIL" ] && git config --global user.email $GIT_EMAIL

[ ! -z "$REPOS" ] && cd /opt/repos &&
    for r in ${REPOS[@]}; do
        git clone $r
    done
