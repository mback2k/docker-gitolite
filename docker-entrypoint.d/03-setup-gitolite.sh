#!/bin/sh
set -e

chown -R git:git ~git

if [ ! -f ~git/.ssh/authorized_keys ]; then
    if [ -f "$SSH_KEY" ]; then
        runuser -u git -- /bin/sh -c 'gitolite setup -pk "$SSH_KEY"'
    else
        echo "Please provide public SSH_KEY for gitolite admin!"
        exit 1
    fi
else
    runuser -u git -- /bin/sh -c 'gitolite setup'
fi
