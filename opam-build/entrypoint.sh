#!/bin/sh -ex

opam init -ya --disable-sandboxing
opam install -y odoc
opam pin add -n .
opam depext -ui $*
opam install -ty $*
