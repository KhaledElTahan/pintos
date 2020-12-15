# run commands in dependencies.sh before commands in this file

# install git
sudo apt-get install git

# download qemu project
mkdir $HOME/apps
cd $HOME/apps
git clone git://git.qemu-project.org/qemu.git
cd $HOME/apps/qemu

# Prepare a native debug build.
mkdir -p bin/debug/native
cd bin/debug/native

# (for 64-bit machines)
../../../configure --target-list=x86_64-softmmu --enable-debug 

# (for 32-bit machines)
../../../configure --target-list=i386-softmmu --enable-debug 

# If you get this error "pixman >= 0:21:8 not present.", execute the following command and
git submodule update --init pixman
# repeat the configuration step. << VERY IMPORTANT


# if you get this error "DTC (libfdt) version >= 1:4:0 not present.", execute the following
# command and repeat the configuration step
git submodule update --init dtc
# repeat the configuration step. << VERY IMPORTANT

make

# Test your build by
cd $HOME/apps/qemu/bin/debug/native

# For 64-bit machines
cd x86_64-softmmu

# For 32-bit machines
cd i386-softmmu

# then list files, you should find executable qemu-system-x86_64 for 64bit machines and
# executable qemu-system-i386 for 32bits machines
ls

# Create a link from the executable binary to be called via /bin/qemu

# For 64-bit machines
sudo ln -s $HOME/apps/qemu/bin/debug/native/x86_64-softmmu/qemu-system-x86_64 /bin/qemu

# For 32-bit machines
sudo ln -s $HOME/apps/qemu/bin/debug/native/i386-softmmu/qemu-system-i386 /bin/qemu

# check that qemu installed correctly
which qemu # should print the path of qemu /bin/qemu