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
info "Install docker"

apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get install -y docker-ce

# -------------------------------------------------------------------- #
info "User vagrant do not need to run docker"

gpasswd -a vagrant docker
service docker restart
su - vagrant -c "docker ps"

# -------------------------------------------------------------------- #
info "Add docker to autoload"

systemctl start docker
systemctl enable docker