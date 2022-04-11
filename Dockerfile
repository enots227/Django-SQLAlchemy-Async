# syntax=docker/dockerfile:1
FROM python:3 AS base

# Install Linux Packages
RUN apt update
RUN apt install dos2unix

# Copy Build Script
COPY ./scripts/build.sh /usr/src/bin/build.sh
RUN  dos2unix           /usr/src/bin/build.sh

# Package Install List
COPY ./requirements.txt /tmp/app/requirements.txt
RUN  dos2unix           /tmp/app/requirements.txt

# Build Python Environment
RUN bash /usr/src/bin/build.sh

# Copy Development Scripts
COPY ./scripts/development/start.sh    /usr/src/bin/start.sh
RUN  dos2unix                          /usr/src/bin/start.sh

# Entrypoint
WORKDIR /usr/src/app

ENTRYPOINT /usr/src/bin/start.sh

