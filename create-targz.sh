#!/bin/bash


# install necessary dependencies 
sudo apt-get -y -q update
sudo apt-get -y -q install curl gnupg cdebootstrap

# create a bootstrap of ISO
sudo cdebootstrap -a -q --keyring=$KEYRING $ARCH --include=sudo,git,ssh,gnupg,man,less,curl,bash-completion,vim /home/ debianGZ http://deb.debian.org/debian/

echo "Debian ISO successfully bootstrapped"