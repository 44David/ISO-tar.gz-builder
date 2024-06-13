#!/bin/bash


# install necessary dependencies and keyrings if not already installed
sudo apt-get -y -q update
sudo apt-get -y -q install curl gnupg cdebootstrap debian-archive-keyring tar

#create target directory
sudo mkdir debian-installer

# create a bootstrap of ISO
sudo cdebootstrap --arch amd64 bookworm /debian-installer http://deb.debian.org/debian

# installs necessary packages in directory
sudo chroot /debian-installer /bin/bash

apt-get update
apt-get install -y wget vim,sudo,git,ssh,gnupg,man,curl

exit 

# create tar.gz
tar -czf deb-installer.tar.gz -C /debian-installer

echo "ISO image successfully bootstrapped"
