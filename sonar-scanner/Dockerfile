FROM alpine@sha256:826f70e0ac33e99a72cf20fb0571245a8fee52d68cb26d8bc58e53bfa65dcdfa

RUN set -ex; \
    apk add --no-cache \
      git \
    ; \
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/script.sh; \
    sh /tmp/script.sh; \
    rm /tmp/script.sh

CMD ["sonar-scanner"]
