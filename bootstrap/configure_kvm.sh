#!/bin/bash

set -e

apt install -y cpu-checker

kvm-ok || true

modprobe kvm

modprobe nbd max_part=16

usermod -aG kvm $USER

usermod -aG libvirt $USER

systemctl enable libvirtd

systemctl start libvirtd