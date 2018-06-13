FROM alpine:latest

LABEL maintainer="Allen Vailliencourt <allen.vailliencourt@forty8fiftylabs.com>"

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less jq && \
    pip --no-cache-dir install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*

WORKDIR /aws