#!/bin/sh -ex

LOCAL_PKGS=`ls *.opam|xargs -I'{}' basename '{}' .opam`
opam init -ya --disable-sandboxing
opam depext -u odoc ${LOCAL_PKGS}
# TODO get a host binary of odoc instead
opam install -y odoc
opam install -y --with-test .
