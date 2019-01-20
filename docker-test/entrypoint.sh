#!/bin/sh -ex

docker images

docker run -it ${DOCKER_IMAGE}:master opam list
