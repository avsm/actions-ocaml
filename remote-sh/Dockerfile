FROM alpine

LABEL "com.github.actions.name"="sh-fwd"
LABEL "com.github.actions.description"="forward a command to a remote server"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="arrow-right-circle"

LABEL "repository"="http://github.com/avsm/actions-ocaml"
LABEL "homepage"="http://github.com/avsm/actions-ocaml"
LABEL "maintainer"="Anil Madhavapeddy <anil@recoil.org>"

RUN apk add --update util-linux rsync openssh
ADD entrypoint.sh /entrypoint.sh 
ENTRYPOINT ["/entrypoint.sh"]
