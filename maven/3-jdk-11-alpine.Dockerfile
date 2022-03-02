FROM azul/zulu-openjdk-alpine:11@sha256:d9dd6a66363b248f0e7e070ebbe7fb455fcecc449960016c84340d7d12cea04d

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
