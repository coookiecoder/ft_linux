LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu

cd /mnt/lfs/sources
tar -xf xz-5.4.6.tar.xz
cd xz-5.4.6

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.6

make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la

cd ..
rm -rf xz-5.4.6
