FROM azul/zulu-openjdk-alpine:11@sha256:1cc11a933fb817a6382bf571d2555402c28b8b2798d78e9785b27e8b9995557e

RUN set -ex; \
    apk add --no-cache \
      bash \
      curl \
      git \
      jq \
      openssh-client \
      procps \
      wget \
    ; \
    \
    # Install Docker client.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/docker/install-alpine.sh -O- | sh; \
    docker --version; \
    \
    # Install Maven.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version; \
    \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins
