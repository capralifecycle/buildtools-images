FROM azul/zulu-openjdk-alpine:8@sha256:8c003555371739ac3581d46ec5506edd82a8d630342dc16373688cb0b31cfc90

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
