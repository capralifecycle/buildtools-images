FROM azul/zulu-openjdk-alpine:8@sha256:593148c4edaf58f6b4df870cf522696e98ac2546437b47d5f8638bd87448dcf6

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
