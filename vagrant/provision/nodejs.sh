#!/usr/bin/env bash

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

# -------------------------------------------------------------------- #

info "Install NodeJS and Yarn"

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt-get install -y nodejs \
                   build-essential \
                   yarn