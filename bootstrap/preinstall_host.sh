#!/bin/bash

set -e

apt update

apt install -y \

git \
curl \
wget \
vim \
nano \
jq \
tree \
rsync \
zip \
unzip \
openssh-server \
openssh-client \
net-tools \
bridge-utils \
dnsutils \
lsof \
tcpdump \
htop \
iotop \
sysstat \
build-essential \
gcc \
g++ \
make \
cmake \
pkg-config \
python3 \
python3-pip \
python3-venv \
python3-dev \
bats \
fio \
parted \
gdisk \
kpartx \
lvm2 \
mdadm \
debootstrap \
cloud-image-utils \
libguestfs-tools \
guestfs-tools \
virtinst \
virt-viewer \
libvirt-clients \
libvirt-daemon-system \
qemu-system-x86 \
qemu-kvm \
qemu-utils \
ovmf \
swtpm \
grub-pc-bin

systemctl enable ssh
systemctl start ssh