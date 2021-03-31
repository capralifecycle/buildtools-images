FROM alpine@sha256:ec14c7992a97fc11425907e908340c6c3d6ff602f5f13d899e6b7027c9b4133a

RUN set -ex; \
    apk add --no-cache \
      git \
    ; \
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/script.sh; \
    sh /tmp/script.sh; \
    rm /tmp/script.sh

CMD ["sonar-scanner"]
