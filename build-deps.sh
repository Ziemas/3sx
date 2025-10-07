#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
THIRD_PARTY="$ROOT_DIR/third_party"

mkdir -p "$THIRD_PARTY"

# Detect OS
OS="$(uname -s)"
echo "Detected OS: $OS"

# -----------------------------
# FFmpeg
# -----------------------------

FFMPEG_TAG="n5.1.2"
FFMPEG_DIR="$THIRD_PARTY/ffmpeg"
FFMPEG_BUILD="$FFMPEG_DIR/build"

if [ -d "$FFMPEG_BUILD" ]; then
    echo "FFmpeg already built at $FFMPEG_BUILD"
else
    echo "Building FFmpeg..."
    mkdir -p "$FFMPEG_DIR"
    cd "$FFMPEG_DIR"

    if [ ! -d "ffmpeg" ]; then
        git clone https://git.ffmpeg.org/ffmpeg.git
    fi

    cd ffmpeg
    git fetch --tags
    git checkout "$FFMPEG_TAG"

    mkdir -p build
    cd build

    case "$OS" in
        Darwin)
            ../configure \
                --prefix="$FFMPEG_BUILD" \
                --enable-shared \
                --disable-static \
                --enable-pic \
                --extra-cflags="-fPIC" \
                --extra-ldflags="-Wl,-rpath,@loader_path/../Frameworks" \
                --install-name-dir="@rpath"
            ;;
        Linux)
            ../configure \
                --prefix="$FFMPEG_BUILD" \
                --enable-shared \
                --disable-static \
                --enable-pic \
                --extra-cflags="-fPIC" \
                --extra-ldflags="-Wl,-rpath,\$ORIGIN/../lib" \
                --install-name-dir=\$ORIGIN
            ;;
        MINGW*|MSYS*|CYGWIN*)
            ../configure \
                --prefix="$FFMPEG_BUILD" \
                --enable-shared \
                --disable-static \
                --extra-cflags="-IC:/msys64/mingw64/include" \
                --extra-ldflags="-LC:/msys64/mingw64/lib"
            ;;
        *)
            echo "Unsupported OS: $OS"
            exit 1
            ;;
    esac

    make -j$(nproc)
    make install
    echo "FFmpeg installed to $FFMPEG_BUILD"
fi

# -----------------------------
# SDL3
# -----------------------------

SDL_TAG="release-3.2.0"
SDL_DIR="$THIRD_PARTY/sdl3"
SDL_BUILD="$SDL_DIR/build"

if [ -d "$SDL_BUILD" ]; then
    echo "SDL3 already built at $SDL_BUILD"
else
    echo "Building SDL3..."
    mkdir -p "$SDL_DIR"
    cd "$SDL_DIR"

    if [ ! -d "SDL" ]; then
        git clone https://github.com/libsdl-org/SDL.git
    fi

    cd SDL
    git checkout "$SDL_TAG"

    mkdir -p build
    cd build

    case "$OS" in
        Darwin|Linux)
            cmake .. \
                -DCMAKE_INSTALL_PREFIX="$SDL_BUILD" \
                -DBUILD_SHARED_LIBS=ON \
                -DSDL_STATIC=OFF
            ;;
        MINGW*|MSYS*|CYGWIN*)
            cmake .. \
                -G "MinGW Makefiles" \
                -DCMAKE_INSTALL_PREFIX="$SDL_BUILD" \
                -DBUILD_SHARED_LIBS=ON
            ;;
    esac

    cmake --build . -j$(nproc)
    cmake --install .
    echo "SDL3 installed to $SDL_BUILD"
fi

echo "All dependencies installed successfully in $THIRD_PARTY"
