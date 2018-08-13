#!/usr/bin/env bash

function info {
  echo "----------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------"
}

info "Convert vagrant OpenSSH key to Putty .ppk"

cp /vadock/.vagrant/machines/"$@"/virtualbox/private_key /vadock/ssh/vagrant
ssh-keygen -y -f /vadock/ssh/vagrant > /vadock/ssh/vagrant.pub

puttygen /vadock/.vagrant/machines/"$@"/virtualbox/private_key -o /vadock/ssh/vagrant.ppk