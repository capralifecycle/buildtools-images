FROM maven:3-jdk-8-slim

# procps added because of https://issues.jenkins-ci.org/browse/JENKINS-40101
RUN apt-get update && \
    apt-get install -y \
      procps \
      git \
  && rm -rf /var/lib/apt/lists/*
