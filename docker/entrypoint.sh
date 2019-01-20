#!/bin/sh -ex

PKGS=`ls *.opam | xargs -I'{}' basename '{}' .opam`

IMAGE=foo

echo Building: ${PKGS}

sed -e "s/%%PKGS%%/${PKGS}/g" Dockerfile.template > Dockerfile.build

cat Dockerfile.build

docker build -f Dockerfile.build ${IMAGE}

if [ ! -e "$HOME/.docker/config.json" ]; then
  echo Need the Docker login action in the workflow to push image.
  exit 0
else
  echo TODO push
fi
