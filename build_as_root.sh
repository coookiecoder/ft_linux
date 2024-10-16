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

mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
  mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

# Entering the Chroot Environment

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(8)"      \
    TESTSUITEFLAGS="-j$(8)" \
    /bin/bash --login
