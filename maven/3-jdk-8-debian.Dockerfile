FROM azul/zulu-openjdk-debian:8@sha256:79693425a526ac0e0aca8768d29dd9746e9f20bb889353a9d929b727e02c9f5e

# procps added because of https://issues.jenkins-ci.org/browse/JENKINS-40101
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      curl \
      git \
      procps \
      wget \
      zip \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    # Install Maven.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/maven-3/install.sh -O- | sh; \
    mvn -version; \
    \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    useradd -u 1000 jenkins
