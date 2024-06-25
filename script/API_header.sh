LFS=/mnt/lfs

cd /mnt/lfs/sources
tar -xf linux-6.7.4.tar.xz
cd linux-6.7.4

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

cd ../..
rm -rf linux-6.7.4
