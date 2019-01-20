#!/bin/sh -ex

docker run ${DOCKER_IMAGE}:master opam list 
mkdir foo
cd foo
docker run ${DOCKER_IMAGE}:master tar -C /home/opam/.opam -cf - . | tar -xf -
find .
