#!/bin/bash -eux

if [[ $ANSIBLE_CLEANUP  =~ true || $ANSIBLE_CLEANUP =~ 1 || $ANSIBLE_CLEANUP =~ yes ]]; then
  # Uninstall Ansible and remove PPA.
  apt -y remove --purge ansible
  apt-add-repository --remove ppa:ansible/ansible
fi

# Apt cleanup.
apt autoremove
apt update

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
