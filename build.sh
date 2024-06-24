#bin utils

cd /mnt/lfs/sources

tar -xf binutils-2.42.tar.xz
mkdir -v binutils-2.42/build
cd binutils-2.42/build
../configure --prefix=$LFS/tools --with-sysroot=$LFS --target=x86_64-lfs-linux-gnu --disable-nls  --enable-gprofng=no --disable-werror --enable-default-hash-style=gnu
make
make install
