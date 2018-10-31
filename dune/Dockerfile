FROM alpine:edge
LABEL "com.github.actions.name"="dune"
LABEL "com.github.actions.description"="Build a local dune project"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update opam ocaml-compiler-libs git alpine-sdk
RUN git clone --depth=1 git://github.com/ocaml/dune && cd dune && make && sudo make install && cd .. && rm -rf dune
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
