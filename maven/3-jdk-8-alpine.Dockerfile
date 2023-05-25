FROM azul/zulu-openjdk-alpine:8@sha256:b325dcdd353cd46c524d9d34044444dda5855a5c7e581fb3179fed9e48bb650b

RUN set -ex; \
    apk add --no-cache \
      bash \
      curl \
      git \
      procps \
      wget \
      zip \
    ; \
    \
    # Install Maven.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version; \
    \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins
