#! /bin/bash

# This script extracts the runtime dependencies (DLLs) from the MinGW
# library path and copys them into a directory of choice.

LIBPATH=/windows/mingw64/bin
DISTPATH=$1

set -ex
cp $LIBPATH/libogg-0.dll $DISTPATH
cp $LIBPATH/libopus-0.dll $DISTPATH
cp $LIBPATH/libopusfile-0.dll $DISTPATH
cp $LIBPATH/libportaudio.dll $DISTPATH
cp $LIBPATH/libsamplerate-0.dll $DISTPATH
cp $LIBPATH/libgcc_s_seh-1.dll $DISTPATH
cp $LIBPATH/libwinpthread-1.dll $DISTPATH
# cp $LIBPATH/libssp-0.dll $DISTPATH