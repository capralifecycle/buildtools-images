FROM azul/zulu-openjdk-debian:17@sha256:e904a1160c5d71a7ce7a4b896fb2073f104d55af1bbda63b486427f871134b93

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
      # Needed for `npm install keytar` for cals-cli.
      libsecret-1-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    # Install Node.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/node/install.sh -O /tmp/script.sh; \
    sh /tmp/script.sh; \
    rm /tmp/script.sh; \
    node --version; \
    npm --version; \
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
