#!/bin/sh -ex

if [ "${OCAML_VERSION}" != "" ]; then
  OPAMSWITCH="${OCAML_VERSION}"
fi

if [ "$*" = "" ]; then
  LOCAL_PKGS=`ls *.opam|xargs -I'{}' basename '{}' .opam`
  opam depext -u odoc ${LOCAL_PKGS}
  # TODO get a host binary of odoc instead
  opam install -y odoc
  opam install -y --with-test --deps-only .
else
  sh -c "opam $*"
fi
