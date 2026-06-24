#!/bin/bash

echo "=== CPU ==="
lscpu

echo
echo "=== KVM ==="
lsmod | grep kvm

echo
echo "=== NBD ==="
lsmod | grep nbd

echo
echo "=== Libvirt ==="
virsh version

echo
echo "=== QEMU ==="
qemu-system-x86_64 --version

echo
echo "=== MDADM ==="
mdadm --version