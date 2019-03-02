#!/bin/sh
set -e

sed -i -E 's/^#?((Password|Kerberos|GSSAPI)Authentication)\s.*/\1 no/g' /etc/ssh/sshd_config
sed -i -E 's/^#?(PubkeyAuthentication)\s.*/\1 yes/g' /etc/ssh/sshd_config
sed -i -E 's/^#?(Subsystem\ssftp\s)/#\1/g' /etc/ssh/sshd_config
