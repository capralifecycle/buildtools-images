FROM azul/zulu-openjdk-alpine:8@sha256:7df872738b53905d4b17a20362033b3e2daf96ed8db58fb81600a8a334ee63b0

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
