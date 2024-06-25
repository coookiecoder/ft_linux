LFS_TGT=$(uname -m)-lfs-linux-gnu

cd /mnt/lfs/sources/glibc-2.39/build

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c -o a.out
readelf -l a.out | grep '/ld-linux'

rm -v dummy.c a.out
