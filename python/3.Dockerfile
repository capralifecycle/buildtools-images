FROM python:3-slim@sha256:ad719a882ac0594bdc92abccff22e5b6713bbf9893320264fd9e8affd8a6f470

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
