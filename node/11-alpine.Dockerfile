FROM alpine@sha256:074d3636ebda6dd446d0d00304c4454f468237fdacf08fb0eeac90bdbfa1bac7

RUN set -eux; \
    echo "#!/bin/sh" >/usr/local/bin/node; \
    echo 'echo >&2 "This Docker image for Node 11 is no longer maintained. Migrate to Node 12 or newer."' >>/usr/local/bin/node; \
    echo 'echo >&2 "See https://github.com/capralifecycle/buildtools-images/tree/master/node"' >>/usr/local/bin/node; \
    echo 'exit 1' >>/usr/local/bin/node; \
    chmod +x /usr/local/bin/node; \
    cp -p /usr/local/bin/node /usr/local/bin/npm

CMD ["sh"]
