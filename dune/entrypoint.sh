#!/bin/sh -ex

sh -c "opam config exec -- dune $* --verbose"
