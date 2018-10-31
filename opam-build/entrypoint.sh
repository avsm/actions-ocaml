#!/bin/sh -ex

opam list
opam pin add -n .
opam depext -ui $*
opam install -y $*
