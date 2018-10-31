#!/bin/sh -exl

opam pin add -n .
opam depext -ui $*
opam install -y $*
