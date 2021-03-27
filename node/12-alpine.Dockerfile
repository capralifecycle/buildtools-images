FROM node:12-alpine@sha256:b1b260826bea495c02f35228b37e7b63e50dffc9fca4f9c9a532787a5de978ea

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
    npm install -g npm@7; \
    npm cache clean --force; \
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
