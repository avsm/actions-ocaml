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

mkdir ~/.ssh
ssh-keyscan >> ~/.ssh/known_hosts

ssh $HOST ls -la
ssh $HOST id
