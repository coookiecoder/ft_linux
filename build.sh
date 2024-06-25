LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu

#bin utils

./script/binutils.sh

#gcc

./script/gcc.sh

#API header

./script/API_header.sh

#libc

./script/libc.sh

#test step

./test_libc.sh
echo "WATCH OUT FOR ANY ERROR HERE, will resume in 10 seconds";
sleep 10;

#make header

$LFS/tools/libexec/gcc/$LFS_TGT/13.2.0/install-tools/mkheaders

#libc++

./script/libc++.sh
