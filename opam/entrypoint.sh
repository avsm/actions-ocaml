#!/bin/sh -ex

# Ensure we persist the opam root
if [ -d "${GITHUB_WORKSPACE}/.opam" ]; then
  mv /home/opam/.opam /home/opam/.opam.old
else
  sudo chown -R opam ${GITHUB_WORKSPACE}
  mv /home/opam/.opam ${GITHUB_WORKSPACE}/.opam
fi
ln -s ${GITHUB_WORKSPACE}/.opam /home/opam/.opam

if [ "${OCAML_VERSION}" != "" ]; then
  OPAMSWITCH="${OCAML_VERSION}"
fi

git -C /home/opam/opam-repository pull && opam update -uy

if [ "$*" = "" ]; then
  opam pin add -n .
  LOCAL_PKGS=`ls *.opam|xargs -I'{}' basename '{}' .opam`
  opam depext -u odoc ${LOCAL_PKGS}
  # TODO get a host binary of odoc instead
  opam install -y odoc
  opam install -y --with-test --deps-only .
else
  sh -c "opam $*"
fi
