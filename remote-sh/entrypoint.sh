#!/bin/sh -e

if [ "$HOST" = "" ]; then
  echo Must specify HOST variable in action configuration.
  exit 1
fi

if [ "$HOST_SSH_KEY_ID" != "" ]; then
  echo Using $HOST_SSH_KEY_ID key for remote ssh target.
  v="HOST_SSH_KEY_${HOST_SSH_KEY_ID}"
  eval HOST_SSH_KEY=\$$v
fi

if [ "$HOST_USER" = "" ]; then
  HOST_USER="root"
fi

if [ "$HOST_SSH_KEY" = "" ]; then
   echo Must specify HOST_SSH_KEY in secrets configuration.
   echo "You can also define HOST_SSH_KEY_ID and define a HOST_SSH_KEY_<id> secret instead."
   exit 1
fi

mkdir -p /root/.ssh
chmod 700 /root/.ssh 
echo "$HOST_SSH_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

# Construct a fresh directory on remote host
UUID=`uuidgen -r`

SSH="ssh -o StrictHostKeyChecking=no -o PasswordAuthentication=no -l$HOST_USER $HOST"

function cleanup {
  echo Transferring workspace/ back to $GITHUB_WORKSPACE locally.
  sudo rsync -az ${HOST_USER}@${HOST}:${UUID}/ ${GITHUB_WORKSPACE}/
  echo Cleaning up $UUID on remote server.
  $SSH rm -rf $UUID
}

$SSH mkdir $UUID
trap cleanup EXIT

echo Syncing workspace to remote server with uuid ${UUID}
rsync -az ${GITHUB_WORKSPACE}/ ${HOST_USER}@${HOST}:${UUID}/

for cmd in "$@"; do
    echo "Running '$cmd' on remote server"
    if $SSH "cd $UUID; $cmd"; then
        echo "Successfully ran '$cmd'"
    else
        exit_code=$?
        echo "Failure running '$cmd', exited with $exit_code"
        exit $exit_code
    fi
done
