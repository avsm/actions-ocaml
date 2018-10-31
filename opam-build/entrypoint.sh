#!/bin/sh -ex

id
pwd
ls -la ~
export OPAMROOT=/home/opam/.opam
export OPAMYES=1
opam list
opam pin add -n .
opam depext -ui $*
opam install -y $*
