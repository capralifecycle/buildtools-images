FROM azul/zulu-openjdk-alpine:8

RUN set -ex; \
    apk add --no-cache \
      bash \
      curl \
      git \
      procps \
      wget \
    ; \
    \
    # Install Maven.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version; \
    \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins
