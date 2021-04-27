#!/bin/sh -xe

# Note: as of 2.6.9, you need to change line 566 of pintos.  Replace:
#     user_shortcut: keys=ctrlaltdel
# with
#     keyboard: user_shortcut=ctrl-alt-del
# to accommodate the new bochsrc.txt syntax

V=2.6.11

if test 1 != "$#"; then
    echo "usage: $0 <install-prefix>" >&2
    exit 2
fi
export PREFIX="$1"

SRCDIR=$(dirname $(readlink -f "$0"))
if test ! -d "$SRCDIR"; then
    echo "cannot file src directory" >&2
    exit 1
fi

if test ! -f "$SRCDIR/bochs-$V.tar.gz"; then
    wget -O "$SRCDIR/bochs-$V.tar.gz" \
	 "https://sourceforge.net/projects/bochs/files/bochs/$V/bochs-$V.tar.gz/download"
fi

builddir=$(mktemp -d /tmp/bochsXXXXXXXXX)
trap "rm -rf \"$builddir\"" 0

cd "$builddir"
tar xzf "$SRCDIR/bochs-$V.tar.gz"
cd "bochs-$V"

for patchfile in "$SRCDIR/bochs-$V"-*.patch; do
    patch -p1 -i "$patchfile"
done

CFGOPTS="--with-x --with-x11 --with-term --with-nogui"
mkdir plain
(cd plain &&
        ../configure $CFGOPTS --prefix="$PREFIX" --enable-gdb-stub &&
        make -j$(nproc) &&
        make install)
mkdir with-dbg
(cd with-dbg &&
        ../configure --enable-debugger --disable-debugger-gui $CFGOPTS --prefix="$PREFIX" &&
        make -j$(nproc) &&
        cp bochs "$PREFIX/bin/bochs-dbg")
