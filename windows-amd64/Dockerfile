FROM rwgrim/msys2-cross
LABEL os=windows
LABEL arch=amd64

ENV GOVERSION="1.24.0"
ENV GOOS=windows
ENV GOARCH=amd64
ENV GOPATH=/go
ENV CGO_ENABLED=1
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV PKG_CONFIG_PATH=/windows/mingw64/lib/pkgconfig
ENV MSYS2_ARCH=x86_64

# install build dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    gcc-mingw-w64-x86-64 \
    git \
    protobuf-compiler \
    upx-ucl \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# install golang
RUN set -ex \
    && wget -P /tmp -q https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go$GOVERSION.linux-amd64.tar.gz

# Symlink for /etc/mtab is needed for pacman to work   
RUN set -ex \
    && ln -s /proc/mounts /etc/mtab \
    && pacman -Syu --noconfirm

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

# install build dependencies (code generators)
RUN set -ex \
    && GOOS=linux GOARCH=amd64 go install github.com/golang/protobuf/protoc-gen-go@latest \
    && GOOS=linux GOARCH=amd64 go install github.com/asim/go-micro/cmd/protoc-gen-micro/v3@latest

COPY ./scripts /scripts