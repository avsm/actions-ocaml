#!/bin/sh -ex

docker run ${DOCKER_IMAGE}:master opam list 
docker run ${DOCKER_IMAGE}:master tar -C /home/opam/.opam -cf - . | tar -xf -
find .
