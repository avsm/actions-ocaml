FROM alpine
LABEL "com.github.actions.name"="checks"
LABEL "com.github.actions.description"="Testing Github checs"
LABEL "com.github.actions.icon"="tick"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update git curl jq
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
