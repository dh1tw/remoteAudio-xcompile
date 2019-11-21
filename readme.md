# (Cross-)Compiling remoteAudio with Docker Containers

![](https://github.com/dh1tw/remoteaudio-xcompile/workflows/Build%20Containers/badge.svg)

[remoteAudio](https://github.com/dh1tw/remoteAudio) is a flexible, low latency audio streaming solution (mainly) for remote amateur radio purposes.
It is completely Open Source and written in [Go](https://golang.org). remoteAudio is available for all modern operating systems and architectures.

This repository contains Dockerfiles with cross compilation chains used to generate the remoteAudio binaries for armhf, arm64, i386 and amd64 architectures.

## Prerequisites

You need to have [docker](https://docker.com) installed on your system. Docker provides excellent documentation on [how to intstall docker](https://docs.docker.com/install/) for your OS / distribution.

## How to invoke

You can compile the remoteAudio source code for armhf, arm64, i386 and amd64 directly from the source code directory. In example, for compiling the binary for linux/arm64 you have to execute the following command:

``` bash

$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp dh1tw/remoteaudio-xcompile:linux-arm64 /bin/sh -c 'make install-deps && make dist'

```

## Build containers locally

You can also build the containers locally if you like. For example the one for linux-arm64:

``` bash

$ docker build -t me/remoteaudio-xcompile:linux-arm64 ./arm64

```
