FROM golang:1.13-buster
LABEL arch=i386

ENV GOOS=linux
ENV GOARCH=386
ENV CGO_ENABLED=1
ENV CC=gcc
ENV PATH="/go/bin/${GOOS}_${GOARCH}:${PATH}"

# install build & runtime dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        protobuf-compiler \
        upx \
        gcc-multilib \
        libc6-dev-i386 \
        linux-libc-dev:i386 \
        pkg-config:i386 \
        libsamplerate0:i386 \
        libsamplerate0-dev:i386 \
        libopusfile-dev:i386 \
        libopus-dev:i386 \
        libportaudio2:i386 \
        portaudio19-dev:i386 \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN GOARCH=amd64 go get github.com/gogo/protobuf/protoc-gen-gofast \
    && GOARCH=amd64 go get github.com/GeertJohan/go.rice/rice \
    && GOARCH=amd64 go get github.com/micro/protoc-gen-micro