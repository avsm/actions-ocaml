FROM ocaml/opam2
LABEL "com.github.actions.name"="dune"
LABEL "com.github.actions.description"="Build a local dune project"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

ENV OPAMYES=1
ENV OPAMROOT=/home/opam/.opam
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
