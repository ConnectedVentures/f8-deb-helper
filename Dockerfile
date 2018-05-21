FROM phusion/baseimage

WORKDIR /deb-helper

COPY build-deb build-deb
COPY docker-jazz docker-jazz
COPY push-deb  push-deb

ENV VERSION=v4.0.1

ENTRYPOINT ["/bin/bash", "docker-jazz"]