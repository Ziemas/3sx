#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Syntax: $0 <output directory>"
    exit 1
fi

SCRIPTDIR=$(realpath $(dirname "${BASH_SOURCE[0]}"))
NPROCS="$(getconf _NPROCESSORS_ONLN)"
INSTALLDIR="$1"
if [ "${INSTALLDIR:0:1}" != "/" ]; then
	INSTALLDIR="$PWD/$INSTALLDIR"
fi


SDL=SDL3-3.2.24
FFMPEG=6.0

mkdir -p deps-build
cd deps-build

export LDFLAGS="-L$INSTALLDIR/lib"
export CFLAGS="-I$INSTALLDIR/include"
export CXXFLAGS="-I$INSTALLDIR/include"

cat > SHASUMS <<EOF
81cc0fc17e5bf2c1754eeca9af9c47a76789ac5efdd165b3b91cbbe4b90bfb76  $SDL.tar.gz
57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082  ffmpeg-$FFMPEG.tar.xz
EOF

curl -L \
	-O "https://libsdl.org/release/$SDL.tar.gz" \
	-O "https://ffmpeg.org/releases/ffmpeg-$FFMPEG.tar.xz" \

shasum -a 256 --check SHASUMS

echo "Building SDL..."
rm -fr "$SDL"
tar xf "$SDL.tar.gz"
cd "$SDL"
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$INSTALLDIR" -DCMAKE_INSTALL_PREFIX="$INSTALLDIR" -DBUILD_SHARED_LIBS=ON -DSDL_SHARED=ON -DSDL_STATIC=OFF -G Ninja
cmake --build build --parallel
ninja -C build install
cd ..

echo "Installing FFmpeg..."
rm -fr "ffmpeg-$FFMPEG"
tar xf "ffmpeg-$FFMPEG.tar.xz"
cd "ffmpeg-$FFMPEG"
#LDFLAGS="-dead_strip $LDFLAGS" CFLAGS="-Os $CFLAGS" CXXFLAGS="-Os $CXXFLAGS" \
    ./configure --prefix="$INSTALLDIR" \
    --cc='clang' --cxx='clang++' \
    --disable-all --disable-autodetect --disable-static --enable-shared \
    --enable-avcodec --enable-avformat --enable-avutil --enable-swresample \
    --enable-encoder=pcm_s16be,pcm_s16le \
    --enable-decoder=adpcm_adx \
    --enable-parser=adx \
    --enable-muxer=adx 
make "-j$NPROCS"
make install
cd ..

echo "Cleaning up..."
cd ..
rm -rf deps-build
