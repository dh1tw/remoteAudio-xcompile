FROM golang:1.13-buster
LABEL os=linux
LABEL arch=amd64

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=1
ENV CC=gcc

# install build & runtime dependencies
RUN apt update \
    && apt install -y --no-install-recommends \
        protobuf-compiler \
        upx \
        pkg-config \
        libsamplerate0:amd64 \
        libsamplerate0-dev:amd64 \
        libopusfile-dev:amd64 \
        libopus-dev:amd64 \
        libportaudio2:amd64 \
        portaudio19-dev:amd64 \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN go get github.com/gogo/protobuf/protoc-gen-gofast \
    && go get github.com/GeertJohan/go.rice/rice \
    && go get github.com/micro/protoc-gen-micro