FROM azul/zulu-openjdk-alpine:11

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
    # install Docker client
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/docker/install-alpine.sh -O- | sh; \
    docker --version; \
    \
    # install Maven
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version
