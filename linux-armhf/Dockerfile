FROM golang:1.24-bookworm
LABEL os=linux
LABEL arch=armhf

ENV GOOS=linux
ENV GOARCH=arm
ENV CGO_ENABLED=1
ENV CC=arm-linux-gnueabihf-gcc
ENV PATH="/go/bin/${GOOS}_${GOARCH}:${PATH}"
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig

# enable backports since upx isn't available in the default bookworm repos
RUN echo 'deb http://deb.debian.org/debian bookworm-backports main' > /etc/apt/sources.list.d/backports.list

# install build & runtime dependencies
RUN dpkg --add-architecture armhf \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    protobuf-compiler \
    upx-ucl \
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
RUN GOARCH=amd64 go install github.com/golang/protobuf/protoc-gen-go@latest \
    && GOARCH=amd64 go install github.com/asim/go-micro/cmd/protoc-gen-micro/v3@latest