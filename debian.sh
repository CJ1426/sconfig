#!/bin/sh
packages="opendoas tmux openssh-client openssh-server openssh-sftp-server"

echo "install xorg and openbox? : "
read choose

if [ "$choose" = "y" ]; then
	packages="$packages xorg openbox"
fi

apt install $packages;

. ./setup.sh
