#!/bin/sh
set -e

for SSH_ALG in rsa dsa ecdsa ed25519; do
    SSH_KEY=/etc/ssh/keys/ssh_host_${SSH_ALG}_key
    if [ ! -f "$SSH_KEY" ]; then
        ssh-keygen -q -t $SSH_ALG -f $SSH_KEY -N ''
    fi
    if grep -q -v "HostKey $SSH_KEY" /etc/ssh/sshd_config; then
        echo "HostKey $SSH_KEY" >> /etc/ssh/sshd_config
    fi
done
