#!/bin/sh -ex

LOCAL_PKGS=`ls *.opam|xargs -I'{}' basename '{}' .opam`
opam init -ya --disable-sandboxing
opam install -y odoc
opam pin add -n .
opam depext -ui ${LOCAL_PKGS}
opam install -y --with-test .
