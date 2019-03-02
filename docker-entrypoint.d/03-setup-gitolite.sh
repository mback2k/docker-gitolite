#!/bin/sh
set -ex

chown -R git:git ~git

if [ ! -f ~git/.ssh/authorized_keys ]; then
    if [ -f "$SSH_KEY" ]; then
        su - git -c 'gitolite setup -pk "$SSH_KEY"'
    else
        echo "Please provide public SSH_KEY for gitolite admin!"
        exit 1
    fi
else
    su - git -c 'gitolite setup'
fi
