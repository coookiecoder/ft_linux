LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu

cd /mnt/lfs/sources
tar -xf bash-5.2.21.tar.gz
cd bash-5.2.21

./configure --prefix=/usr                      \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc

make
make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh

cd ..
rm -rf bash-5.2.21
