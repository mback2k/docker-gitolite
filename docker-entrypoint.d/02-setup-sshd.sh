#!/bin/sh
set -e

sed -i -E 's/^#?(PasswordAuthentication)\s.*/\1 no/g' /etc/ssh/sshd_config
sed -i -E 's/^#?(PubkeyAuthentication)\s.*/\1 yes/g' /etc/ssh/sshd_config
sed -i -E 's/^#?(Subsystem\ssftp\s)/#\1/g' /etc/ssh/sshd_config

if [ -n "$SSH_HOST" ]; then
    sed -i -E "s/^#?(ListenAddress)\s.*/\1 $SSH_HOST/g" /etc/ssh/sshd_config
fi
