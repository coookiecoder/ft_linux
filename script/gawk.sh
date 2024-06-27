LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu


cd /mnt/lfs/sources
tar -xf gawk-5.3.0.tar.xz
cd gawk-5.3.0

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

cd ..
rm -rf gawk-5.3.0
