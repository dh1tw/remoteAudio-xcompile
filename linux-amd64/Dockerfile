FROM golang:1.13-buster
LABEL arch=amd64

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=1
ENV CC=gcc

RUN apt update \
    && apt install -y --no-install-recommends \
        protobuf-compiler \
        upx \
        pkg-config:amd64 \
        libsamplerate0:amd64 \
        libsamplerate0-dev:amd64 \
        libopusfile-dev:amd64 \
        libopus-dev:amd64 \
        libportaudio2:amd64 \
        portaudio19-dev:amd64 \
    && rm -rf /var/lib/apt/lists/*