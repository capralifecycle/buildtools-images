FROM python:3-slim@sha256:9c51896b90ca7175dc8aafcf8408207f404f247728228fb857add24bb26a18fa

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
