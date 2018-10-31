FROM alpine:edge
LABEL "com.github.actions.name"="dune build"
LABEL "com.github.actions.description"="Build a local dune project"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update opam
RUN opam init -ya
RUN opam install -y dune
ENV OPAMYES=1
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
