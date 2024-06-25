LFS=/mnt/lfs

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

mkdir -p /home/lfs

cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF

cp -r ../ft_linux /home/lfs/
chown -R lfs /home/lfs/ft_linux
