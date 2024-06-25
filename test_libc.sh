LFS_TGT=$(uname -m)-lfs-linux-gnu

cd /mnt/lfs/

echo 'int main(){}' > dummy.c
/mnt/lfs/tools/bin/$LFS_TGT-gcc dummy.c -o a.out
readelf -l a.out | grep '/ld-linux'

rm -v dummy.c a.out
