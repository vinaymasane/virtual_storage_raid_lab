#!/bin/bash

### Common functions for the host machine
source ./common_host.sh

LOGFILE=/var/log/raidlab-bootstrap.log

exec > >(tee -a "$LOGFILE")
exec 2>&1

### Pre-installation steps for the host machine
PACKAGES=(
    git
    curl
    wget
    vim
    nano
    jq
    tree
    rsync
    zip
    unzip
    openssh-server
    openssh-client
    net-tools
    bridge-utils
    dnsutils
    lsof
    tcpdump
    htop
    iotop
    sysstat
    build-essential
    gcc
    g++
    make
    cmake
    pkg-config
    python3
    python3-pip
    python3-venv
    python3-dev
    bats
    fio
    parted
    gdisk
    kpartx
    lvm2
    mdadm
    debootstrap
    cloud-image-utils
    libguestfs-tools
    guestfs-tools
    virtinst
    virt-viewer
    libvirt-clients
    libvirt-daemon-system
    qemu-system-x86
    qemu-kvm
    qemu-utils
    ovmf
    swtpm
    grub-pc-bin
)

echo "====================================="
echo "Updating package metadata"
echo "====================================="

apt update

echo
echo "====================================="
echo "Installing packages"
echo "====================================="

for pkg in "${PACKAGES[@]}"
do

    if dpkg -s "$pkg" >/dev/null 2>&1
    then
        echo "[INFO] $pkg already installed"

        apt install \
            --only-upgrade \
            --no-install-recommends \
            -y \
            "$pkg" || true

    else
        echo "[INFO] Installing $pkg"

        apt install \
            --no-install-recommends\
            -y \
            "$pkg" || true
    fi

done

echo
echo "Bootstrap completed"

### Ensure that the SSH service is running
ensure_service_running ssh
