FROM alpine@sha256:08d6ca16c60fe7490c03d10dc339d9fd8ea67c6466dea8d558526b1330a85930

RUN set -eux; \
    echo "#!/bin/sh" >/usr/local/bin/node; \
    echo 'echo >&2 "This Docker image for Node 11 is no longer maintained. Migrate to Node 12 or newer."' >>/usr/local/bin/node; \
    echo 'echo >&2 "See https://github.com/capralifecycle/buildtools-images/tree/master/node"' >>/usr/local/bin/node; \
    echo 'exit 1' >>/usr/local/bin/node; \
    chmod +x /usr/local/bin/node; \
    cp -p /usr/local/bin/node /usr/local/bin/npm

CMD ["sh"]
