#!/bin/sh -ex

if [ "$HOST" = "" ]; then
  echo Must specify HOST variable in action configuration.
  exit 1
fi

if [ "$HOST_USER" = "" ]; then
  HOST_USER="root"
fi

if [ "$HOST_SSH_KEY" = "" ]; then
   echo Must specify HOST_SSH_KEY in secrets configuration.
fi

# Construct a fresh directory on remote host
UUID=`uuidgen -r`

env

mkdir -p /root/.ssh
chmod 700 /root/.ssh 
echo "$HOST_SSH_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

ssh -vv -o "StrictHostKeyChecking no" -o PasswordAuthentication=no "$HOST_USER@$HOST" ls -la
ssh -o "StrictHostKeyChecking no" -o PasswordAuthentication=no "$HOST_USER@$HOST" id
