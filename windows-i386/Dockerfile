FROM rwgrim/msys2-cross
LABEL os=windows
LABEL arch=i386

ENV GOVERSION="1.13.4"
ENV GOOS=windows
ENV GOARCH=386
ENV GOPATH=/go
ENV CGO_ENABLED=1
ENV CC=i686-w64-mingw32-gcc
ENV CXX=i686-w64-mingw32-g++
ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV PKG_CONFIG_PATH=/windows/mingw32/lib/pkgconfig
ENV MSYS2_ARCH=i686

# install build dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        gcc-mingw-w64-i686 \
        git \
        protobuf-compiler \
        upx \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

# install golang
RUN set -ex \
    && wget -P /tmp -q https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go$GOVERSION.linux-amd64.tar.gz

# install build dependencies
RUN set -ex \
    && pacman --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-libsamplerate \
    && pacman --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-portaudio \
    && pacman --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-opus \
    && pacman --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-opusfile \
    && pacman --noconfirm -Sc

# install runtime dependencies (DLLs)
RUN set -ex \
    && pacman-cross --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-libsamplerate \
    && pacman-cross --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-portaudio \
    && pacman-cross --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-opus \
    && pacman-cross --noconfirm --needed -Sy mingw-w64-$MSYS2_ARCH-opusfile \
    && pacman-cross --noconfirm -Sc

# Workaround for go get
ENV GOOS=linux
ENV GOARCH=amd64

# install build dependencies (code generators)
RUN set -ex \
    && GOOS=linux GOOARCH=amd64 go get github.com/gogo/protobuf/protoc-gen-gofast \
    && GOOS=linux GOOARCH=amd64 go get github.com/GeertJohan/go.rice/rice \
    && GOOS=linux GOOARCH=amd64 go get github.com/micro/protoc-gen-micro

# /workaround
ENV GOOS=windows
ENV GOARCH=386

COPY ./scripts /scripts