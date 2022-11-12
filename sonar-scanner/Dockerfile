FROM alpine@sha256:b95359c2505145f16c6aa384f9cc74eeff78eb36d308ca4fd902eeeb0a0b161b

RUN set -ex; \
    apk add --no-cache \
      git \
    ; \
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/script.sh; \
    sh /tmp/script.sh; \
    rm /tmp/script.sh

CMD ["sonar-scanner"]
