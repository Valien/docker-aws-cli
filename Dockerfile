FROM python:3-alpine

MAINTAINER Allen Vailliencourt <allen.vailliencourt@forty8fiftylabs.com>

RUN apk update && apk upgrade && \
    apk add py-pip groff && \
    #addgroup -S awsgroup && adduser -sh awsuser -G awsgroup -D && \
    pip install --upgrade awscli

ENV AWS_PROFILE="default"
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

# Runs application as scout2 and not root. 
#USER awsuser
#WORKDIR /aws
WORKDIR /home/awsuser

ENTRYPOINT ["/bin/sh"] 
#, "/entrypoint.sh"]