FROM python:3.7.6-stretch

VOLUME ["/share"]

WORKDIR /share

RUN pip install pip --upgrade
RUN pip install ansible

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

ADD run.sh /bin

ENTRYPOINT ["/bin/run.sh"]
