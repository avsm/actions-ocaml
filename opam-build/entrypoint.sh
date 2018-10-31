#!/bin/sh -ex

opam init -ya --disable-sandboxing
opam pin add -n .
opam depext -ui $*
opam install -y $*
