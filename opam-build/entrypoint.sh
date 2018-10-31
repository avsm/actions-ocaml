#!/bin/sh -ex

LOCAL_PKGS=`ls *.opam|xargs -I'{}' basename '{}' .opam`
opam init -ya --disable-sandboxing
# TODO get a host binary instead
opam install -y odoc
opam depext -ui ${LOCAL_PKGS}
opam install -y --with-test .
