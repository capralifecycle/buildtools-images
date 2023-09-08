FROM python:3-slim@sha256:9bd704d713fde6cebdd54779c121da9c3ddd28808797e4f93d58af0050e8ba70

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
