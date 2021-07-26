FROM python:3-slim@sha256:c5f60863db103c951595f110def9244c1e09efe9e8d072cfac3da39310bc8cc8

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
