FROM alpine@sha256:69e70a79f2d41ab5d637de98c1e0b055206ba40a8145e7bddb55ccc04e13cf8f

RUN set -eux; \
    echo "#!/bin/sh" >/usr/local/bin/node; \
    echo 'echo >&2 "This Docker image for Node 11 is no longer maintained. Migrate to Node 12 or newer."' >>/usr/local/bin/node; \
    echo 'echo >&2 "See https://github.com/capralifecycle/buildtools-images/tree/master/node"' >>/usr/local/bin/node; \
    echo 'exit 1' >>/usr/local/bin/node; \
    chmod +x /usr/local/bin/node; \
    cp -p /usr/local/bin/node /usr/local/bin/npm

CMD ["sh"]
