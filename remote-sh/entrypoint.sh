#!/bin/sh -ex

if [ "$HOST" = "" ]; then
  echo Must specify HOST variable in action configuration.
  exit 1
fi

if [ "$HOST_SSH_KEY" = "" ]; then
   echo Must specify HOST_SSH_KEY in secrets configuration.
fi

# Construct a fresh directory on remote host
UUID=`uuidgen -r`

mkdir -p ~/.ssh
ssh-keyscan >> ~/.ssh/known_hosts
echo "$HOST_SSH_KEY" > ~/.ssh/id_rsa
chmod -R 600 ~/.ssh 

ssh $HOST ls -la
ssh $HOST id
