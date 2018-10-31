#!/bin/sh -ex

opam init -ya
opam pin add -n .
opam depext -ui $*
opam install -y $*
