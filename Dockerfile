FROM alpine:latest

LABEL maintainer="Allen Vailliencourt <allen.vailliencourt@forty8fiftylabs.com>"

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less jq && \
    pip --no-cache-dir install --upgrade pip awscli aws-shell && \
    rm -rf /var/cache/apk/*

RUN addgroup -g 28000 awscli && adduser awscli -u 28000 -G awscli -s /bin/sh -D

USER awscli

WORKDIR /aws