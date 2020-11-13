FROM azul/zulu-openjdk-debian:11@sha256:7abb8c96a52d2cfe2fb38b3c340f55134c9f92b390143a0049bf191e2b049013

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      curl \
      git \
      jq \
      openssh-client \
      procps \
      wget \
      zip \
    ; \
    rm -rf /var/lib/apt/lists/*; \
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
    useradd -u 1000 jenkins
