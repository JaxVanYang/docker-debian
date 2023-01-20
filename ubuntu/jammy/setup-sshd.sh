#!/usr/bin/env bash

set -ex

if [ -z "${JENKINS_AGENT_SSH_PUBKEY}" ]; then
	echo "ERROR: no SSH public key provided!" 1>&2
	exit 1
fi

echo "${JENKINS_AGENT_SSH_PUBKEY}" > /home/jenkins/.ssh/authorized_keys
chown -Rf jenkins:jenkins /home/jenkins/.ssh
chmod 0700 /home/jenkins/.ssh

mkdir /run/sshd

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "${@}"
