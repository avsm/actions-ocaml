#!/bin/sh -ex

docker run ${DOCKER_IMAGE}:master opam list
