wget --input-file=wget-list-sysv --continue --directory-prefix=/mnt/lfs/sources
mkdir -pv /mnt/lfs/usr /mnt/lfs/var /mnt/lfs/usr/bin /mnt/lfs/usr/lib /mnt/lfs/usr/sbin
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs /mnt/lfs/usr /mnt/lfs/var /mnt/lfs/usr/bin /mnt/lfs/usr/lib /mnt/lfs/usr/sbin
chown -v lfs /mnt/lfs /mnt/lfs/sources /mnt/lfs/sources/*

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac
