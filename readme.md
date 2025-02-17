# (Cross-)Compiling remoteAudio with Docker Containers

![](https://github.com/dh1tw/remoteaudio-xcompile/workflows/Build%20Containers/badge.svg?branch=master)

[remoteAudio](https://github.com/dh1tw/remoteAudio) is a flexible, low latency audio streaming solution (mainly) for remote amateur radio purposes.
It is completely Open Source and written in [Go](https://golang.org). remoteAudio is available for all modern operating systems and architectures.

Despite that Go can cross compile for a variety of architectures and operating systems out of the box,
things get complicated once [cgo](https://golang.org/cmd/cgo) and external C libraries are needed.

This repository contains a set of Dockerfiles with cross compilation chains preinstalled. These
cross compilation chains allow building the remoteAudio binaries conveniently with just one command for:

| Operating System | Architecture  |
| -----------------| --------------|
| **Linux**        | amd64 (64bit) |
|                  | i386 (32bit)  |
|                  | armhf (32bit) |
|                  | arm64 (64bit) |
| **Windows**      | amd64 (64bit) |
|                  | i386 (32bit)  |

## Prerequisites

You need to have [docker](https://docker.com) installed on your system. Docker provides excellent documentation on [how to install docker](https://docs.docker.com/install/) for your OS / distribution.

## How to invoke

You can compile the remoteAudio source code directly from the source code directory. In example, for compiling the binary for linux/arm64 you have to execute the following command:

``` bash

$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp dh1tw/remoteaudio-xcompile:linux-arm64 /bin/sh -c 'make dist'

```

## Get Windows runtime dependencies

For compiling the Windows binaries, the [MinGW](https://en.wikipedia.org/wiki/MinGW) compiler is used. The
needed runtime dependencies (DLLs) can be copied into the source directory after compilation with the following command (Powershell):

```bash

$ docker run --rm -v ${pwd}:/usr/src/myapp -w /usr/src/myapp dh1tw/remoteaudio-xcompile:windows-amd64 /bin/sh -c 'make dist && /scripts/getlibs.sh .'

```

## Build containers locally

You can also build the containers locally if you like. For example the one for linux-arm64:

``` bash

$ docker build -t me/remoteaudio-xcompile:linux-arm64 ./linux-arm64

```
