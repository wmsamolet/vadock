#!/bin/bash
function info {
  echo "----------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------"
}

info "DOCKER REINIT (NGINX + PHP) DETACHED"

###################################################################################
VDK_COMPOSE=""
if [ ! -z "$1" ]
  then VDK_COMPOSE="."$1
fi
info "VDK_COMPOSE ${VDK_COMPOSE}"
###################################################################################

###################################################################################
VDK_PATH=$PWD
if [ ! -z "$2" ]
  then VDK_PATH=$2
fi
info "VDK_PATH ${VDK_PATH}"
###################################################################################

(cd ${VDK_PATH} && docker-compose down)
(cd ${VDK_PATH} && docker volume prune -f)
(cd ${VDK_PATH} && rm -rf docker/logs/*)
(cd ${VDK_PATH} && docker-compose -p "${VDK_PATH}" -f "${VDK_PATH}"/docker-compose"${VDK_COMPOSE}".yml up -d --build)

docker ps
