FROM alpine@sha256:08d6ca16c60fe7490c03d10dc339d9fd8ea67c6466dea8d558526b1330a85930

RUN set -ex; \
    apk add --no-cache \
      git \
    ; \
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/script.sh; \
    sh /tmp/script.sh; \
    rm /tmp/script.sh

CMD ["sonar-scanner"]
