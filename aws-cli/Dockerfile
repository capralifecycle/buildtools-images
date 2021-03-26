FROM alpine:latest@sha256:826f70e0ac33e99a72cf20fb0571245a8fee52d68cb26d8bc58e53bfa65dcdfa

RUN set -eux; \
    apk -v --no-cache add \
      bash \
      git \
      jq \
      py-pip \
      groff \
    ; \
    pip install awscli; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins

CMD ["sh"]
