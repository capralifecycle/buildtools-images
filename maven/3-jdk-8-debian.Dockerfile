FROM maven:3-jdk-8-slim

# procps added because of https://issues.jenkins-ci.org/browse/JENKINS-40101
RUN set -eux; \
    apt-get update; \
    apt-get install -y \
      procps \
      git \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    useradd -u 1000 jenkins
