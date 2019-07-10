# Maven Docker Image

This repo contains the definition of the maven utility
image used in our Jenkins pipelines.

## Alpine version

This is the default image we use.

## Debian version

Use if you need glibc and not musl, e.g if you
have dependencies like sqlite4java which does not have binaries for musl
(https://bitbucket.org/almworks/sqlite4java/issues/84/binary-for-alpine-linux)
