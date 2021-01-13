FROM alpine:latest
MAINTAINER Anton Kiselev

ENV ZMP_VERSION=2.1.32

ENV ZMP_HOST=192.168.1.10
ENV ZMP_PORT=7777
ENV ZMP_PLAYLIST=http://immo.date/ero.m3u

RUN mkdir /opt/zmp/ && mkdir /opt/zmp/playlist/ && cd /opt/zmp/ && \
    wget -O zmp-linux-amd64 -P /opt/zmp/ "https://github.com/Antonditto/docker-zmp/blob/master/ZMP/$ZMP_VERSION/zmp-linux-amd64?raw=true" && \
    chmod +x /opt/zmp/zmp-linux-amd64

ENTRYPOINT ["/bin/sh" , "-c" , "./opt/zmp/zmp-linux-amd64 --host $ZMP_HOST --port $ZMP_PORT --rosnd --best $ZMP_PLAYLIST"]
