FROM alpine:edge
LABEL "com.github.actions.name"="opam"
LABEL "com.github.actions.description"="access the opam cli"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update ocaml-compiler-libs opam ocaml-dev ocaml-ocamldoc ocaml-doc m4 alpine-sdk
ENV OPAMYES=1
ENV OPAMROOTISOK=1
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
