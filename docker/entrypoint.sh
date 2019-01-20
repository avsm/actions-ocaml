#!/bin/sh -ex

PKGS=`ls *.opam | xargs -I'{}' basename '{}' .opam`

IMAGE=foo

echo Building: ${PKGS}

if [ -e "Dockerfile.action" ]; then
  echo Dockerfile.action cannot exist in source repository.
  exit 1
fi

sed -e "s/%%PKGS%%/${PKGS}/g" /Dockerfile.template > Dockerfile.action

cat Dockerfile.action

docker build -f Dockerfile.action ${IMAGE}

if [ ! -e "$HOME/.docker/config.json" ]; then
  echo Need the Docker login action in the workflow to push image.
  exit 0
else
  echo TODO push
fi
