FROM alpine:edge
LABEL "com.github.actions.name"="opam build"
LABEL "com.github.actions.description"="Build a local opam project"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update opam m4 alpine-sdk
ENV OPAMYES=1
ENV OPAMROOTISOK=1
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
