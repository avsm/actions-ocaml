#!/bin/sh -ex

opam pin add -n .
opam depext -ui $*
opam install -y $*

ls -la
opam list 
