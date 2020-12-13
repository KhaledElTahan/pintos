# run commands in qemu.sh before commands in this file

# Any refer to $PINTOSHOME should be replaced with pintos absolute path
# for example $PINTOSHOME -> /home/vm/pintos/

# Add PINTOSHOME to path variable 
echo "export PATH=~/pintos/src/utils:$PATH" >> ~/.bashrc

# Reload environment variables
source ~/.bashrc

sudo apt-get install libc6-dbg gdb valgrind

# GDBMACROS
# Edit $PINTOSHOME/src/utils/pintos-gdb to change the definition of GDBMACROS to
# point to where you installed gdb-macros. Test the installation by running pintos-gdb without
# any arguments. If it does not complain about missing gdb-macros, it is installed correctly.
# Change this line GDBMACROS=/usr/class/cs140/pintos/pintos/src/misc/gdb-macros to
# GDBMACROS=$PINTOSHOME/src/misc/gdb-macros.
# Example: GDBMACROS=/home/ubuntu/pintos/src/misc/gdb-macros
# Note: do not forget to use the absolute path in place of $PINTOSHOME.


# Compile the Utilities
cd $PINTOSHOME/src/utils
make

# ignore any warnings :D

# Set Qemu as Your Simulator
# edit $PINTOSHOME/src/threads/Make.vars and change the line SIMULATOR = --bochs to SIMULATOR = --qemu


# Compile Pintos Kernel
cd $PINTOSHOME/src/threads/
make
# A new "build" directory will be created as a sub-directory of: $PINTOSHOME/src/threads/


# Edit util Files
# edit $PINTOSHOME/src/utils/pintos by replacing $sim = "bochs" if !defined $sim; in line
# number 103 with $sim = "qemu" if !defined $sim;.
# also in the same file line 621, change my (@cmd) = ('qemu-system-i386'); to my (@cmd) = ('qemu');

# Edit $PINTOSHOME/src/utils/pintos by replacing kernel.bin in line number 257 with
# the absolute path pointing to it: $PINTOSHOME/src/threads/build/kernel.bin

# Edit $PINTOSHOME/src/utils/Pintos.pm by replacing loader.bin in line number 362
# with the absolute path pointing to it: $PINTOSHOME/src/threads/build/loader.bin

# change pintos permissions
cd $PINTOSHOME/src/utils
chmod 777 pintos

# Run pintos
pintos run alarm-multiple
cd $PINTOSHOME/src/threads
make grade

#### NOTES ####

# pintos.pm and pintos, don't use variables. Use absolute paths directly.
# so "my $name = find_file ('$PINTOSHOME/src/threads/build/kernel.bin');" is wrong,
# you should write the absolute path for-exampe "my $name = find_file ('/usr/username/pintos/src/threads/build/kernel.bin');"

# qemu might not be installed correctly, try removing "qemu" from /bin and 
# re running the command "sudo ln -s $HOME/apps/qemu/x86_64-softmmu/qemu-system-x86_64 /bin/qemu"

# You might copy the command directly from the pdf and the "_" was discarded. Make sure you've written has the _ in x86_64