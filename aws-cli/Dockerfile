FROM alpine:latest

RUN set -eux; \
    apk -v --no-cache add \
      bash \
      git \
      jq \
      py2-pip \
      python \
      groff \
    ; \
    pip install awscli

CMD ["sh"]
