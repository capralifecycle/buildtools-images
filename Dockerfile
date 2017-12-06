FROM maven:3.5.2-slim

RUN apt-get update && \
    apt-get install -y \
      procps \
      git \
  && rm -rf /var/lib/apt/lists/*
