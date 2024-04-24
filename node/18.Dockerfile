FROM node:18@sha256:98218110d09c63b72376137860d1f30a4f61ce029d7de4caf2e8c00f3bcf0db7

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      # groff is dependency for aws cli
      groff \
      jq \
      # Needed for `npm install keytar` for cals-cli.
      libsecret-1-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      pipx \
      zip \
      # Other utils
      diffutils \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install awscli; \
    aws --version; \
    \
    # Install Docker client.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/docker/install.sh -O- | sh; \
    docker --version; \
    \
    # Install sonar-scanner.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/sonar-scanner.sh; \
    sh /tmp/sonar-scanner.sh; \
    rm /tmp/sonar-scanner.sh

CMD ["bash"]
