#!/bin/sh -x

if [ -e "Dockerfile.action" ]; then
  echo Dockerfile.action cannot exist in source repository.
  exit 1
fi

if [ "${DOCKER_IMAGE}" = "" ]; then
  echo Must set DOCKER_IMAGE to a Docker Hub user/repo for caching deps
  exit 1
fi

DOCKER_TAG=master

PKGS=`ls *.opam | xargs -I'{}' basename '{}' .opam`
echo Building opam packages: ${PKGS}

IMG=${DOCKER_IMAGE}:${DOCKER_TAG}

if docker pull ${IMG} then
  echo Existing base image found, refreshing it
  BASE_IMG=${IMG}
else
  echo No image at ${IMG} so creating fresh one
  BASE_IMG=ocaml/opam2
fi

sed -e "s/%%PKGS%%/${PKGS}/g" -e "s/%%BASE_IMG%%/${IMG}/g" /Dockerfile.template > Dockerfile.action

cat Dockerfile.action

echo github ref = $GITHUB_REF
docker build -f Dockerfile.action -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

if [ ! -e "$HOME/.docker/config.json" ]; then
  echo Need the Docker login action in the workflow to push image.
  exit 0
else
  docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
fi
