FROM python:3.7-alpine
MAINTAINER Gary Leong <gwleong@gmail.com>

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8

RUN apk add --no-cache bash
RUN apk add --no-cache wget
RUN apk add --no-cache git
RUN apk add --no-cache curl
RUN apk add --no-cache rsync
RUN apk add --no-cache ansible
RUN apk add --no-cache openssh

RUN ansible --version

ADD run.sh /var/tmp/
RUN chmod 777 /var/tmp/run.sh

ENTRYPOINT ["/var/tmp/run.sh"]
