FROM python:3-slim@sha256:fb121df3d2e19d98f86e466dba5a92773bcfc481c94e689f8e924ccd184cc8ec

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
