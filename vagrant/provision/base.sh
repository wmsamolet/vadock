#!/usr/bin/env bash

#== Import script args ==

timezone=$(echo "$1")

#== Bash helpers ==

function info {
  echo "----------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------"
}

#== Provision script ==

info "Provision-script user: `whoami`"

export DEBIAN_FRONTEND="noninteractive"

info "Configuring timezone"
timedatectl set-timezone ${timezone} --no-ask-password

info "Updating OS software"
apt-get update
apt-get upgrade -y

info "Installing base packages"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
apt-get install -y \
    software-properties-common \
    debconf-utils \
    build-essential \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    unzip \
    curl \
    mc \
    tmux \
    vim \
    git \
    putty-tools \
    sshpass