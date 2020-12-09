#!/bin/sh

set -euo pipefail

ANSIBLE_RELEASE=centos-release-ansible-29 

echo "Checking ansible installation"
rpm -q $ANSIBLE_RELEASE || dnf install -y $ANSIBLE_RELEASE
rpm -q ansible || dnf install -y ansible
test -d /root/.ansible/collections/ansible_collections/openvswitch || ansible-galaxy collection install openvswitch.openvswitch

ansible-playbook -i inventory playbook.yaml
