#!/usr/bin/env bash

set -ex

packages=(
	build-essential
	devscripts
	debmake
	openssh-server
	openjdk-11-jdk
	# git
	# curl
	# wget
	# sbuild
	# fakeroot
	# vim
)

apt-get update
apt-get install -y --no-install-recommends --no-install-suggests "${packages[@]}"
rm -rf /var/lib/apt/lists/*
