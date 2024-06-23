#wget --input-file=wget-list-sysv --continue --directory-prefix=/mnt/lfs/sources
#mkdir -pv /mnt/lfs/{etc,var} /mnt/lfs/usr/{bin,lib,sbin}
#groupadd lfs
#useradd -s /bin/bash -g lfs -m -k /dev/null lfs
#chown -v lfs /mnt/lfs/{usr{,/*},lib,var,etc,bin,sbin,tools}

#bin utils

tar -xf /mnt/lfs/sources/binutils-2.42.tar.xz -C /mnt/lfs/sources/
mkdir -v /mnt/lfs/sources/binutils-2.42/build
cd /mnt/lfs/sources/binutils-2.42/build
../configure --prefix=$LFS/tools --with-sysroot=$LFS --target=x86_64-lfs-linux-gnu --disable-nls  --enable-gprofng=no --disable-werror --enable-default-hash-style=gnu
make
make install
