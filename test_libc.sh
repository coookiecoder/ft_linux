LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu

echo 'int main(){}' > $LFS/dummy.c
$LFS_TGT-gcc $LFS/dummy.c -o $LFS/a.out
readelf -l $LFS/a.out | grep '/ld-linux'

rm -v $LFS/dummy.c $LFS/a.out
