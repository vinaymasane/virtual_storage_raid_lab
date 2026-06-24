#!/bin/bash

### Common functions for the host machine
source ./common_host.sh

### Configure KVM and related services on the host machine
apt install -y cpu-checker

kvm-ok || true

modprobe kvm

modprobe nbd max_part=16

usermod -aG kvm $USER

usermod -aG libvirt $USER

### Ensure that the libvirtd service is running
ensure_service_running libvirtd
