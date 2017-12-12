# This Dockerfile is used by Jenkins to build the application
FROM alpine:latest

# Serverless framework
ENV SERVERLESS_VERSION 1.24.1
RUN apk --no-cache add \
            ca-certificates \
            curl \
            bash \
            jq \
            openssl \
            nodejs \
            nodejs-npm \
    && npm install -g serverless@${SERVERLESS_VERSION}