FROM golang:1.16-buster
LABEL os=linux
LABEL arch=armhf

ENV GOOS=linux
ENV GOARCH=arm
ENV CGO_ENABLED=1
ENV CC=arm-linux-gnueabihf-gcc
ENV PATH="/go/bin/${GOOS}_${GOARCH}:${PATH}"
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig

# install build & runtime dependencies
RUN dpkg --add-architecture armhf \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        protobuf-compiler \
        upx \
        gcc-arm-linux-gnueabihf \
        libc6-dev-armhf-cross \
        pkg-config \
        libsamplerate0:armhf \
        libsamplerate0-dev:armhf \
        libopusfile0:armhf \
        libopusfile-dev:armhf \
        libopus0:armhf \
        libopus-dev:armhf \
        libportaudio2:armhf \
        portaudio19-dev:armhf \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN GOARCH=amd64 go get github.com/gogo/protobuf/protoc-gen-gofast \
    && GOARCH=amd64 go get github.com/GeertJohan/go.rice/rice \
    && GOARCH=amd64 go get github.com/micro/protoc-gen-micro