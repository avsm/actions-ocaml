#!/bin/sh -ex

docker run -v ${GITHUB_WORKSPACE}:/mnt ${DOCKER_IMAGE}:master opam list 
docker run -v ${GITHUB_WORKSPACE}:/mnt ${DOCKER_IMAGE}:master ls -la /mnt/
