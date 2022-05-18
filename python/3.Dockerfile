FROM python:3-slim@sha256:54956d6c929405ff651516d5ebbc204203a6415c9d2757aaddcde35be680431e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
