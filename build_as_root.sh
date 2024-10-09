LFS=/mnt/lfs
LFS_TGT=$(uname -m)-lfs-linux-gnu
export MAKEFLAGS='-j8'

#change ownership
chown -R root:root $LFS/usr
chown -R root:root $LFS/lib
chown -R root:root $LFS/var
chown -R root:root $LFS/etc
chown -R root:root $LFS/bin
chown -R root:root $LFS/sbin
chown -R root:root $LFS/tools

case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac

#Preparing Virtual Kernel File Systems

mkdir -pv $LFS/dev
mkdir -pv $LFS/proc
mkdir -pv $LFS/sys
mkdir -pv $LFS/run

mount -v --bind /dev $LFS/dev

mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
else
  mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

# Entering the Chroot Environment

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login
