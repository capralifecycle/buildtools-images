FROM node:12-alpine@sha256:0b5c7eb38785da1ad4c105930faca0bc546dfcceb0464724456e277fd5e3f6e2

RUN set -eux; \
    apk --no-cache add \
      bash \
      git \
      # groff is dependency for aws cli
      groff \
      jq \
      make \
      py3-pip \
      zip \
    ; \
    # Due to build issues on newer AWS EC2 instances this config has to be set
    # to avoid the error: "Error: could not get uid/gid".
    # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    npm config set unsafe-perm true; \
    pip3 install awscli; \
    \
    # Install sonar-scanner.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/sonar-scanner.sh; \
    sh /tmp/sonar-scanner.sh; \
    rm /tmp/sonar-scanner.sh

CMD ["sh"]
