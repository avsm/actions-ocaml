FROM ocaml/opam2

LABEL "com.github.actions.name"="dune-release"
LABEL "com.github.actions.description"="upload a release tarball to a tag"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

ENV OPAMYES=1
ENV OPAMROOT=/home/opam/.opam
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
