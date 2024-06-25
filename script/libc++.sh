LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu

cd /mnt/lfs/sources
tar -xf gcc-13.2.0.tar.xz
cd gcc-13.2.0

mkdir -v build
cd       build

../libstdc++-v3/configure --host=$LFS_TGT --build=$(../config.guess) --prefix=/usr --disable-multilib --disable-nls --disable-libstdcxx-pch --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0

make
make DESTDIR=$LFS install

cd ../..
rm -rf gcc-13.2.0
