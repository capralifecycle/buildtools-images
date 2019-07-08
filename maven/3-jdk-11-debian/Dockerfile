FROM azul/zulu-openjdk-debian:11

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      curl \
      git \
      jq \
      openssh-client \
      procps \
      wget \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    # install Docker client
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/docker/install-alpine.sh -O- | sh; \
    docker --version; \
    \
    # install Maven
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version
