FROM golang:1.17-buster
LABEL os=linux
LABEL arch=arm64

ENV GOOS=linux
ENV GOARCH=arm64
ENV CGO_ENABLED=1
ENV CC=aarch64-linux-gnu-gcc
ENV PATH="/go/bin/${GOOS}_${GOARCH}:${PATH}"
ENV PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig

# install build & runtime dependencies
RUN dpkg --add-architecture arm64 \
    && apt update \
    && apt install -y --no-install-recommends \
        protobuf-compiler \
        upx \
        gcc-aarch64-linux-gnu \
        libc6-dev-arm64-cross \
        pkg-config \
        libsamplerate0:arm64 \
        libsamplerate0-dev:arm64 \
        libopusfile0:arm64 \
        libopusfile-dev:arm64 \
        libopus0:arm64 \
        libopus-dev:arm64 \
        libportaudio2:arm64 \
        portaudio19-dev:arm64 \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN GOARCH=amd64 go get github.com/golang/protobuf/protoc-gen-go \
    && GOARCH=amd64 go get github.com/asim/go-micro/cmd/protoc-gen-micro/v3