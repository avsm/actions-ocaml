FROM docker:stable

LABEL "com.github.actions.name"="dockerfile"
LABEL "com.github.actions.description"="generate a Dockerfile for the repository"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

ADD entrypoint.sh /entrypoint.sh
ADD Dockerfile.template /Dockerfile.template
ENTRYPOINT ["/entrypoint.sh"]
