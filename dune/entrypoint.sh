#!/bin/sh -ex

opam list

sh -c "dune $*"
