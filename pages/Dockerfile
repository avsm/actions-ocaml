FROM alpine
LABEL "com.github.actions.name"="pages"
LABEL "com.github.actions.description"="Push Dune docs to GitHub Pages"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update git opam rsync
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
