FROM golang:1.24-bookworm
LABEL os=linux
LABEL arch=i386

ENV GOOS=linux
ENV GOARCH=386
ENV CGO_ENABLED=1
ENV CC=gcc
ENV PATH="/go/bin/${GOOS}_${GOARCH}:${PATH}"
ENV PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig

# enable backports since upx isn't available in the default bookworm repos
RUN echo 'deb http://deb.debian.org/debian bookworm-backports main' > /etc/apt/sources.list.d/backports.list

# install build & runtime dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    protobuf-compiler \
    upx-ucl \
    gcc-multilib \
    pkg-config \
    libc6-dev-i386 \
    linux-libc-dev:i386 \
    libsamplerate0:i386 \
    libsamplerate0-dev:i386 \
    libopusfile0:i386 \
    libopusfile-dev:i386 \
    libopus0:i386 \
    libopus-dev:i386 \
    libportaudio2:i386 \
    portaudio19-dev:i386 \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN GOARCH=amd64 go install github.com/golang/protobuf/protoc-gen-go@latest \
    && GOARCH=amd64 go install github.com/asim/go-micro/cmd/protoc-gen-micro/v3@latest