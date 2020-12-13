# Check whether your machine is 32-bit or 64 bit
# If the output is i686 or i386, then the machine is 32-bit. If it is x86 64, then it is 64-bit.
uname -m

sudo apt-get update

# GCC. Version 4.0 or later is preferred. Version 3.3 or later should work. If the host
# machine has an 80x86 processor, then GCC should be available as gcc; otherwise, an 80x86
# cross-compiler should be available as i386-elf-gcc.
sudo apt-get upgrade gcc

# GNU binutils. Pintos uses addr2line, ar, ld, objcopy, and ranlib. If the host machine is not an 80x86,
# versions targeting 80x86 should be available with an i386-elf- prefix
sudo apt-get install binutils

sudo apt-get install pkg-config
sudo apt-get install zlib1g-dev
sudo apt-get install libglib2.0-dev
sudo apt-get install libfdt-dev
sudo apt-get install libpixman-1-dev
sudo apt-get install gcc libc6-dev
sudo apt-get install autoconf
sudo apt-get install libtool
sudo apt-get install libsdl1.2-dev
sudo apt-get install g++
sudo apt-get install libx11-dev
sudo apt-get install libxrandr-dev
sudo apt-get install libxi-dev
sudo apt-get install libnfs-dev libiscsi-dev

# Perl. Version 5.8.0 or later is preferred. Version 5.6.1 or later should work
sudo apt-get upgrade perl

# If the host machine is not
# an 80x86, a version of GDB targeting 80x86 should be available as i386-elf-gdb
sudo apt-get install libc6-dbg gdb

# GNU make, version 3.80 or later
sudo apt-get install make