FROM node:11-alpine@sha256:914ff2c2145de019a19c080a9e42b5763c826194110ec8e02c8e92845799fba6

RUN set -eux; \
    apk --no-cache add \
      bash \
      git \
      # groff is dependency for aws cli
      groff \
      jq \
      py2-pip \
      python \
    ; \
    # Due to build issues on newer AWS EC2 instances this config has to be set
    # to avoid the error: "Error: could not get uid/gid".
    # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    npm config set unsafe-perm true; \
    pip install awscli; \
    \
    # Install sonar-scanner.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/sonar-scanner.sh; \
    sh /tmp/sonar-scanner.sh; \
    rm /tmp/sonar-scanner.sh

CMD ["sh"]
