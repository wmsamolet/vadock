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
    putty-tools

info "Installing BASH mods"
echo 'force_color_prompt=yes' >> ~/.bashrc
echo 'export TERM=xterm-color' >> ~/.bashrc
echo "export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'" >> ~/.bashrc
echo 'export CLICOLOR=1' >> ~/.bashrc
echo 'export LSCOLORS=ExFxCxDxBxegedabagacad' >> ~/.bashrc
echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '" >> ~/.bashrc
source ~/.bashrc