FROM python:3-slim@sha256:3148289e8e0c96d069c9df023bd4c17f1877fad2fee4f60c36d75ef307b48dd3

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
