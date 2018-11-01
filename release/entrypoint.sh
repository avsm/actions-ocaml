#!/bin/sh -ex

# Ensure we persist the opam root
if [ -d "${GITHUB_WORKSPACE}/.opam" ]; then
  mv /home/opam/.opam /home/opam/.opam.old
else
  mv /home/opam/.opam ${GITHUB_WORKSPACE}/.opam
fi
ln -s ${GITHUB_WORKSPACE}/.opam /home/opam/.opam

if [ "${OCAML_VERSION}" != "" ]; then
  OPAMSWITCH="${OCAML_VERSION}"
fi

opam depext -y dune-release
opam config exec -- dune-release distrib
ls -la _build
