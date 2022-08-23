FROM azul/zulu-openjdk-debian:18@sha256:480c6b24ae628ac2c31841ca78d5801c43ec3b6983eef147b79dd415e231b9b9

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
