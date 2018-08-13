#!/bin/bash

function info {
  echo "----------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------"
}

info "DOCKER INIT (UP + BUILD) ${1}"

###################################################################################
VADOCK_COMPOSE=""
if [ ! -z "$1" ]
  then VADOCK_COMPOSE="."$1
fi
info "VADOCK_COMPOSE ${VADOCK_COMPOSE}"
###################################################################################

###################################################################################
VADOCK_PATH=$PWD
if [ ! -z "$2" ]
  then VADOCK_PATH=$2
fi
info "VADOCK_PATH ${VADOCK_PATH}"
###################################################################################

(cd ${VADOCK_PATH} && docker-compose -p ${VADOCK_PATH} -f ${VADOCK_PATH}/docker-compose"${VADOCK_COMPOSE}".yml up -d --build)

docker ps
