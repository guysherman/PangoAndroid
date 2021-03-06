#! /usr/bin/env bash
# Note this script requires an environment variable called ANDROID_NDK_HOME, mine is /Users/guysherman/Library/Android/ndk-bundle
export TOP="`pwd`"
export TOOLCHAIN=$TOP/../../toolchains/arm-android-crystax/bin
export SYSROOT=$TOOLCHAIN/../sysroot
export CONFIGURE_HOST="arm-linux-androideabi"
export CROSS_PREFIX="arm-linux-androideabi-"
export ARMV7="-march=armv7-a -mfloat-abi=softfp -mfpu=neon"
export ARMV5="-mfpu=vfp"
export HOSTCFLAGS=" -fpic -ffunction-sections -funwind-tables $ARMV7 -Wno-psabi -mthumb -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -DANDROID -Wa,--noexecstack -g -DUSE_ICONV_LOCALE_CHARSET"
export HOSTLDFLAGS="-Wl,--fix-cortex-a8  -Wl,--no-undefined -Wl,-z,noexecstack"
export FIXSHARED="--enable-shared=yes --disable-static ac_cv_host=$CONFIGURE_HOST"
export FIXSHARED2="--enable-shared=yes --disable-static ac_cv_host=$CONFIGURE_HOST"
export FIXSTATIC="--enable-static --disable-shared ac_cv_host=$CONFIGURE_HOST"
export FIXSTATIC2="--enable-static ac_cv_host=$CONFIGURE_HOST"
export GLIB_BIN=/usr/local/Cellar/glib/2.46.2/bin

export PKG_CONFIG_LIBDIR=$SYSROOT/usr/lib/pkgconfig
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig
#export PKG_CONFIG_SYSROOT_DIR=$SYSROOT
export INSTALLDIR=$TOOLCHAIN/../sysroot/usr
export PATH=$GLIB_BIN:$TOP/helper:$SYSROOT/usr/bin:$TOOLCHAIN:$ANDROID_NDK_HOME:$PATH
export CC="${CROSS_PREFIX}gcc $HOSTCFLAGS"
export CXX="${CROSS_PREFIX}g++ $HOSTCFLAGS -DFOOFOOFOO"
export LD="${CROSS_PREFIX}ld"
export STRIP="${CROSS_PREFIX}strip"
export RANLIB="${CROSS_PREFIX}ranlib"
export AR="${CROSS_PREFIX}ar"
export CHOST="arm-linux-androideabi"

./build-libs.sh "$@"
