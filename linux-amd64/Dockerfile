FROM golang:1.24-bookworm
LABEL os=linux
LABEL arch=amd64

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=1
ENV CC=gcc

# enable backports since upx isn't available in the default bookworm repos
RUN echo 'deb http://deb.debian.org/debian bookworm-backports main' > /etc/apt/sources.list.d/backports.list

# install build & runtime dependencies
RUN apt update \
    && apt install -y --no-install-recommends \
    protobuf-compiler \
    upx-ucl \
    pkg-config \
    libsamplerate0:amd64 \
    libsamplerate0-dev:amd64 \
    libopusfile0:amd64 \
    libopusfile-dev:amd64 \
    libopus0:amd64 \
    libopus-dev:amd64 \
    libportaudio2:amd64 \
    portaudio19-dev:amd64 \
    && rm -rf /var/lib/apt/lists/*

# install build dependencies (code generators)
RUN GOARCH=amd64 go install github.com/golang/protobuf/protoc-gen-go@latest \
    && GOARCH=amd64 go install github.com/asim/go-micro/cmd/protoc-gen-micro/v3@latest