# Maven Debian Docker image

This repo contains the definition of the maven utility
image used in our Jenkins pipelines. This image uses Debian as a base
image instead of Alpine.

*Use if you need glibc and not musl, e.g if you
have dependencies like sqlite4java which does not have binaries for musl
(https://bitbucket.org/almworks/sqlite4java/issues/84/binary-for-alpine-linux)*
