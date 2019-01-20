#!/bin/sh -ex

PKGS=`ls *.opam | xargs -I'{}' basename '{}' .opam`

echo Building: ${PKGS}

if [ -e "Dockerfile.action" ]; then
  echo Dockerfile.action cannot exist in source repository.
  exit 1
fi

if [ "${DOCKER_IMAGE}" = "" ]; then
  echo Must set DOCKER_IMAGE to a Docker Hub user/repo for caching deps
  exit 1
fi

sed -e "s/%%PKGS%%/${PKGS}/g" /Dockerfile.template > Dockerfile.action

docker info

cat Dockerfile.action

DOCKER_TAG=master
echo github ref = $GITHUB_REF
docker build -f Dockerfile.action -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

if [ ! -e "$HOME/.docker/config.json" ]; then
  echo Need the Docker login action in the workflow to push image.
  exit 0
else
  docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
fi
