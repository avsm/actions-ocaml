#!/bin/sh -ex

opam list

sh -c "opam config exec -- dune $*"
