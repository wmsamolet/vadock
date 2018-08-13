#!/bin/bash
function info {
  echo "----------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------"
}

info "DOCKER DEINIT (NGINX + PHP) UP + BUILD"

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

(cd ${VADOCK_PATH} && docker-compose -p "${VADOCK_PATH}" -f "${VADOCK_PATH}"/docker-compose"${VADOCK_COMPOSE}".yml down)

(cd ${VADOCK_PATH} && docker volume prune -f)

(cd ${VADOCK_PATH} && rm -rf docker/logs/*)

docker ps