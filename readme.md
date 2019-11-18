# Cross-compiling remoteAudio with Docker

[remoteAudio](https://github.com/dh1tw/remoteAudio) is a flexible, low latency audio streaming solution (mainly) for remote amateur radio purposes.
It is completely Open Source and written in [Go](https://golang.org). remoteAudio is available for all modern operating systems and architectures.

This repository contains the Dockerfiles for the cross compilation chains used to generate the remoteAudio binaries for armhf, arm64 and i386 architectures.

## Prerequisites

You need to have [docker](https://docker.com) installed on your system. Docker provides excellent documentation on [how to intstall docker](https://docs.docker.com/install/) for your OS / distribution.

## How to invoke

You can compile the remoteAudio source code for armhf, arm64 or i386 directly from the source code directory. In example, for compiling the binary for linux/arm64 you have to execute the following command:

``` bash

$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp dh1tw/remoteaudio:linux-arm64 /bin/sh -c 'make install-deps && make dist'

```

## Build containers locally

You can also build the containers locally if you like. For example the one for linux-arm64:

``` bash

$ docker build -t me:remoteaudio:linux-arm64 ./arm64

```