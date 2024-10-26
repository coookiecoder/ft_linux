LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu
export MAKEFLAGS="-j8"

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
#libc++
./script/libc++.sh
#m4
./script/m4.sh
#ncurses
./script/ncurses.sh
#bash
./script/bash.sh
#coreutils
./script/coreutils.sh
#diffutils
./script/diffutils.sh
#file
./script/file.sh
#findutils
./script/findutils.sh
#gawk
./script/gawk.sh
#grep
./script/grep.sh
#gzip
./script/gzip.sh
#make
./script/make.sh
#patch
./script/patch.sh
#sed
./script/sed.sh
#tar
./script/tar.sh
#xz
./script/xz.sh
#bin utils pass 2
./script/binutils2.sh
#gcc pass 2
./script/gcc2.sh
