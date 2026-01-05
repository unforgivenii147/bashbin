#!/usr/bin/env bash
#case "$(uname -m)" in
#  aarch64)
#    export TERMUX_ARCH="aarch64"
#    export TERMUX_TARGET="aarch64-linux-android"
#    ;;
#  armv7l|armv8l)
#    export TERMUX_ARCH="arm"
#    export TERMUX_TARGET="armv7a-linux-androideabi"
#    ;;
#  i686)
#    export TERMUX_ARCH="i686"
#    export TERMUX_TARGET="i686-linux-android"
#    ;;
#  x86_64)
#    export TERMUX_ARCH="x86_64"
#    export TERMUX_TARGET="x86_64-linux-android"
#    ;;
#  *)
#    echo "Unsupported architecture: $(uname -m)"
#    return 1
#    ;;
#esac

# Android API level Termux uses
#export TERMUX_API=24

# Compiler toolchain
export CC="clang"
export CXX="clang++"
export AR="ar"
export RANLIB="ranlib"
export LD="ld"

export OPT_DIR=$PREFIX/opt
# Core build flags
#export CFLAGS="--target=${TERMUX_TARGET}${TERMUX_API} \
export CFLAGS="-I${PREFIX}/include \
               -I${PREFIX}/opt/nodejs-12/include \
               -fPIC -fPIE"

export CXXFLAGS="$CFLAGS"
export LDFLAGS="-L${PREFIX}/lib -fPIE -pie"

# Optional: optimization and debugging settings
export CFLAGS="$CFLAGS -O2"
export CXXFLAGS="$CXXFLAGS -O2"

export PYTHON_CFLAGS="$CFLAGS"
export PYTHON_LDFLAGS="$LDFLAGS"

# Useful when using pip for native builds
export PIP_BUILD_ISOLATION=0
