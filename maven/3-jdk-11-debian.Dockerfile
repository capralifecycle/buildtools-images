FROM azul/zulu-openjdk-debian:11@sha256:367d2d49af96ad4a7e5d1987aa73dce7539274402426069190fdb2837265c8d6

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
