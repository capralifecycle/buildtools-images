FROM azul/zulu-openjdk-debian:8@sha256:e686d0df99433309a7c5e3b25ece4cf42a65028b7810f70ee192d4f0b6e17426

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
