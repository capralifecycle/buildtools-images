FROM azul/zulu-openjdk-debian:20@sha256:323c1f046b35cf8f304a416234e569d85edec9d56accde3a889f507f94f5d346

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
