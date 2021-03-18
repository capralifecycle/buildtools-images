FROM circleci/node:14-browsers@sha256:3bf477d46ad3cbadaa7084a025c7e0cb38ea7d85dbdbabaa24aa5bc9ce902ea7

USER root

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      # groff is dependency for aws cli
      groff \
      # Needed for `npm install keytar` for cals-cli.
      libsecret-1-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    npm install -g npm@7; \
    npm cache clean --force; \
    # Due to build issues on newer AWS EC2 instances this config has to be set
    # to avoid the error: "Error: could not get uid/gid".
    # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    npm config set unsafe-perm true; \
    pip3 install awscli; \
    \
    # Install sonar-scanner.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/sonar-scanner.sh; \
    sh /tmp/sonar-scanner.sh; \
    rm /tmp/sonar-scanner.sh
