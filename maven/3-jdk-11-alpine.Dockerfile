FROM azul/zulu-openjdk-alpine:11@sha256:d1a7919f612f1a2e61a06fc720f8f62b6c8a3378d8e204eb16538152f6e09df7

RUN set -ex; \
    apk add --no-cache \
      bash \
      curl \
      git \
      jq \
      openssh-client \
      procps \
      wget \
      zip \
    ; \
    \
    # Install Docker client.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/docker/install.sh -O- | sh; \
    docker --version; \
    \
    # Install Maven.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version; \
    \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins
