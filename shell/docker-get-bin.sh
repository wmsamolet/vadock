#!/bin/bash

function info {
  echo "----------------------------------------------------------------------------"
  echo " "
  echo "--> $1"
  echo " "
  echo "----------------------------------------------------------------------------"
}

echo "----------------------------------------------------------------------------"
echo
#---------------------------------------------------------------------------------#

BIN_NAME_FROM="php"

if [ ! -z "$1" ]
  then BIN_NAME_FROM=$1
  else
    read -p "Docker bin name: [${BIN_NAME_FROM}]: " READ_BIN_NAME_FROM
fi

if [ ! -z ${READ_BIN_NAME_FROM} ]
then
    BIN_NAME_FROM=${READ_BIN_NAME_FROM}
fi

echo "[BIN_NAME_FROM]: ./docker/bin/${BIN_NAME_FROM}"
echo

#---------------------------------------------------------------------------------#

VADOCK_IMAGE_NAME="vdk_php71"

if [ ! -z "$2" ]
  then VADOCK_IMAGE_NAME=$2
  else
    read -p "Docker image name [${VADOCK_IMAGE_NAME}]: " READ_VADOCK_IMAGE_NAME
fi

if [ ! -z ${READ_VADOCK_IMAGE_NAME} ]
then
    VADOCK_IMAGE_NAME=${READ_VADOCK_IMAGE_NAME}
fi

echo "[VADOCK_IMAGE_NAME]: ${VADOCK_IMAGE_NAME}"
echo

#---------------------------------------------------------------------------------#

BIN_NAME_TO=${BIN_NAME_FROM}

if [ ! -z "$3" ]
  then BIN_NAME_TO=$3
  else
    read -p "Host machine binary name [${BIN_NAME_FROM}]: " READ_BIN_NAME_TO
fi

if [ ! -z ${READ_BIN_NAME_TO} ]
then
    BIN_NAME_TO=${READ_BIN_NAME_TO}
fi

echo "[BIN_NAME_TO]: ${BIN_NAME_TO}"
echo

#---------------------------------------------------------------------------------#

VADOCK_PATH=$PWD

if [ ! -z "$4" ]
  then VADOCK_PATH=$4
  else
    read -p "VADOCK_PATH [${VADOCK_PATH}]: " READ_VADOCK_PATH
fi

if [ ! -z ${READ_VADOCK_PATH} ]
then
    VADOCK_PATH=${READ_VADOCK_PATH}
fi

echo "[VADOCK_PATH]: ${VADOCK_PATH}"
echo

#---------------------------------------------------------------------------------#

info "Set image ${VADOCK_IMAGE_NAME}:${BIN_NAME_FROM} to /usr/bin/${BIN_NAME_TO}"

cp ${VADOCK_PATH}/docker/bin/${BIN_NAME_FROM} /usr/bin/${BIN_NAME_TO}

search="VADOCK_IMAGE_NAME"
replace=${VADOCK_IMAGE_NAME}
sed -i "s#${search}#${replace}#g" /usr/bin/${BIN_NAME_TO}

chmod +x /usr/bin/${BIN_NAME_TO}
