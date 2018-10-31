#!/bin/sh -ex

id
pwd
ls -la ~
opam list
opam pin add -n .
opam depext -ui $*
opam install -y $*
