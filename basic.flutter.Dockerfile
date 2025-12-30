FROM debian:latest AS build-env

ENV DEBIAN_FRONTEND=noninteractive
ARG APP_NAME
ARG BASE_URL
RUN apt-get update && \
    apt-get install -y curl git unzip

ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.38.5
ARG APP=/app/


RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK

RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v
